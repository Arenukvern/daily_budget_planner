import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';

part 'ui_prediction_notifier.freezed.dart';

// TODO(arenukvern): handle taxes
const kAmountsTaxFree = false;

/// balance = expenses + income
/// for example:
/// if expense = -150, income = 50
/// balance = -150 + 50 = -100
typedef ExpenseTotalTuple = ({double balance, double expense, double income});

@freezed
class UiPredictionState with _$UiPredictionState {
  const factory UiPredictionState({
    required final DateTime selectedDate,
    @Default([]) final List<Transaction> expenses,
    @Default([]) final List<Budget> budgets,
    @Default([]) final List<Transaction> incomes,
    @Default(0) final double expensesSum,
    @Default(0) final double regularExpensesSum,
    @Default(0) final double incomesSum,
    @Default(0) final double regularIncomesSum,

    /// is difference between regularIncomesSum + regularExpensesSum,
    /// divided by quantity of days left in the period setted in
    /// the income date.
    @Default(0) final double dailyBudget,

    /// date of the income, when most of regular incomes are expected.
    final DateTime? incomeDate,
  }) = _UiPredictionState;
}

class UiPredictionNotifier extends ValueNotifier<UiPredictionState>
    with HasLocalApis {
  UiPredictionNotifier()
      : super(UiPredictionState(selectedDate: DateTime.now()));

  Future<void> onLoad() async {
    value = UiPredictionState(selectedDate: DateTime.now());
    _recalculateExpenses();
    _recalculateIncomes();
  }

  DateTime get selectedDate => value.selectedDate;

  void onSelectedDateChanged(final DateTime newDate) {
    value = value.copyWith(selectedDate: newDate);
  }

  // TODO(arenukvern): make dependent from period
  double getExpensePredictionFor(final DateTime date) => 0;
  // TODO(arenukvern): make dependent from period
  ExpenseTotalTuple getExpenseFor(final DateTime date) => calculateTotalExpense(
        date.subtract(1.days),
        date,
      );

  /// Calculates the total expense as the difference between all budgets
  /// for the given dates.
  ///
  /// [startDate] and [endDate] are used to filter the budgets within the
  /// specified period.
  /// The total expense is calculated by summing up the amounts of all
  /// budgets within this period.
  ///
  /// Returns the total expense as a tuple with balance, expense, and income.
  ExpenseTotalTuple calculateTotalExpense(
    final DateTime startDate,
    final DateTime endDate,
  ) {
    final dayEnd = endDate.dayEnd;
    final maxStartDate = startDate.dayStart.subtract(const Duration(days: 31));

    final relevantBudgets = value.budgets
        .where(
          (final budget) =>
              budget.date.isBefore(dayEnd) || budget.date == dayEnd,
        )
        .toList()
      ..sort((final a, final b) => b.date.compareTo(a.date));
    if (relevantBudgets.isEmpty) return (balance: 0, expense: 0, income: 0);

    final DateTime effectiveStartDate;
    final closestBudgets = relevantBudgets
        .where((final budget) => !budget.date.isAfter(startDate.dayEnd));
    // Find the budget closest to startDate.dayEnd
    final Budget closestBudget;
    if (closestBudgets.isEmpty) {
      closestBudget = Budget(date: startDate.dayEnd);
    } else if (closestBudgets.length == 1) {
      closestBudget = closestBudgets.first;
    } else {
      closestBudget = closestBudgets.reduce((final a, final b) {
        final aDiff = a.date.difference(startDate.dayEnd).abs();
        final bDiff = b.date.difference(startDate.dayEnd).abs();
        return aDiff < bDiff ? a : b;
      });
    }
    effectiveStartDate = closestBudget.date;

    // Remove all budgets before the closest one
    relevantBudgets.removeWhere(
      (final budget) => budget.date.isBefore(effectiveStartDate),
    );

    if (relevantBudgets.isEmpty ||
        relevantBudgets.lastOrNull?.date.isAfter(effectiveStartDate) == true) {
      final olderBudget = value.budgets.lastWhereOrNull(
        (final budget) =>
            budget.date.isBefore(effectiveStartDate) &&
            budget.date.isAfter(maxStartDate),
      );
      if (olderBudget != null) {
        relevantBudgets.add(olderBudget);
      }
    }
    relevantBudgets.sort((final a, final b) => a.date.compareTo(b.date));
    if (relevantBudgets.isEmpty) return (balance: 0, expense: 0, income: 0);
    if (relevantBudgets.length == 1) {
      final budget = relevantBudgets.first;
      final amount = budget.input.amount(taxFree: kAmountsTaxFree);
      if (budget.date.isBefore(effectiveStartDate) ||
          budget.date == effectiveStartDate) {
        return (
          balance: amount,
          expense: 0,
          income: 0,
        );
      }
      return (
        balance: amount,
        expense: 0,
        income: amount,
      );
    }

    double expense = 0;
    double income = 0;
    double previousAmount =
        relevantBudgets.first.input.amount(taxFree: kAmountsTaxFree);

    for (int i = 1; i < relevantBudgets.length; i++) {
      final difference =
          relevantBudgets[i].input.amount(taxFree: kAmountsTaxFree) -
              previousAmount;
      if (difference < 0) {
        expense += difference.abs();
      } else {
        income += difference;
      }
      previousAmount =
          relevantBudgets[i].input.amount(taxFree: kAmountsTaxFree);
    }

    // If the period starts after the last budget, consider it as an expense
    if (startDate.isAfter(relevantBudgets.last.date)) {
      expense += relevantBudgets.last.input.amount(taxFree: kAmountsTaxFree);
    }

    return (
      balance: relevantBudgets.last.input.amount(taxFree: kAmountsTaxFree),
      expense: expense,
      income: income,
    );
  }

  Budget get recentBudget {
    if (value.budgets.isEmpty) return Budget.empty;
    return value.budgets.first;
  }

  Future<void> removeBudget(final BudgetId budgetId) async {
    final newBudgets =
        value.budgets.where((final b) => b.id != budgetId).toList();
    value = value.copyWith(budgets: newBudgets);
  }

  Future<void> upsertBudget(
    final Budget budget, {
    final bool isNew = false,
  }) async {
    final budgetIndex =
        value.budgets.indexWhere((final b) => b.id == budget.id);
    if (budgetIndex == -1) {
      final updatedBudgets = [...value.budgets, budget]
        ..sort((final a, final b) => b.date.compareTo(a.date));
      value = value.copyWith(budgets: updatedBudgets);
    } else {
      final newBudgets = [...value.budgets]
        ..[budgetIndex] = budget
        ..sort((final a, final b) => b.date.compareTo(a.date));
      value = value.copyWith(budgets: newBudgets);
    }
    // await budgetLocalApi.upsertBudget(budget);
  }

  Future<void> upsertTransaction(final Transaction transaction) async {
    // await expensesLocalApi.upsertRegularExpense(expense);
    switch (transaction.type) {
      case TransactionType.expense:
        value = value.copyWith(
          expenses: value.expenses
              .upsert(transaction, (final e) => e.id == transaction.id),
        );
        _recalculateExpenses();
      case TransactionType.income:
        value = value.copyWith(
          incomes: value.incomes
              .upsert(transaction, (final e) => e.id == transaction.id),
        );
        _recalculateIncomes();
      case TransactionType.transferIn:
      case TransactionType.transferOut:
      // TODO(arenukvern): implement
    }
  }

  void _recalculateExpenses() {
    _setExpensesSum();
    _setRegularExpensesSum();
  }

  void _recalculateIncomes() {
    _setIncomesSum();
    _setRegularIncomesSum();
  }

  Future<void> upsertIncome(final Transaction income) async {
    // await incomesLocalApi.upsertIncome(income);
    value = value.copyWith(
      incomes: value.incomes.upsert(income, (final i) => i.id == income.id),
    );
    _recalculateIncomes();
  }

  void _setExpensesSum() {
    final double sum = value.expenses.fold(
      0,
      (final sum, final expense) =>
          sum + expense.input.amount(taxFree: kAmountsTaxFree),
    );
    value = value.copyWith(expensesSum: sum);
  }

  void _setRegularExpensesSum() {
    final double sum =
        value.expenses.where((final expense) => expense.isRegular).fold(
              0,
              (final sum, final expense) =>
                  sum + expense.input.amount(taxFree: kAmountsTaxFree),
            );
    value = value.copyWith(regularExpensesSum: sum);
  }

  void _setIncomesSum() {
    final double sum = value.incomes.fold(
      0,
      (final sum, final income) =>
          sum + income.input.amount(taxFree: kAmountsTaxFree),
    );
    value = value.copyWith(incomesSum: sum);
  }

  void _setRegularIncomesSum() {
    final double sum =
        value.incomes.where((final income) => income.isRegular).fold(
              0,
              (final sum, final income) =>
                  sum + income.input.amount(taxFree: kAmountsTaxFree),
            );
    value = value.copyWith(regularIncomesSum: sum);
  }
}

/// Extension on [DateTime] to provide a method for getting the
/// date without time.
extension DateTimeWithoutTime on DateTime {
  /// Returns a new [DateTime] instance with the same date but time
  /// set to midnight.
  ///
  /// This is useful for comparing dates without considering the time component.
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2023, 5, 15, 14, 30);
  /// final dateOnly = dateTime.withoutTime; // DateTime(2023, 5, 15, 0, 0, 0, 0)
  /// ```
  DateTime get dayStart => DateTime(year, month, day);
  DateTime get dayEnd => DateTime(year, month, day, 23, 59, 59, 999);
}

// TODO(arenukvern): add to xsoulspace_foundation
extension ListUpsertX<T> on List<T> {
  /// Upserts an element in the list based on a comparison function.
  /// If an element matching the comparison exists, it is replaced.
  /// Otherwise the new element is added to the end of the list.
  List<T> upsert(
    final T item,
    final bool Function(T e) predicate,
  ) {
    final index = indexWhere(predicate);
    if (index < 0) {
      return [...this, item];
    } else {
      return [...this]..[index] = item;
    }
  }
}

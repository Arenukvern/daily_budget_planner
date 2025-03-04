import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';

part 'ui_prediction_notifier.freezed.dart';

/// balance = expenses + income
/// for example:
/// if expense = -150, income = 50
/// balance = -150 + 50 = -100
typedef TransactionsBalanceRecord = ({
  double balance,
  double expense,
  double income
});

@freezed
class UiPredictionState with _$UiPredictionState {
  const factory UiPredictionState({
    required final DateTime selectedDate,
    @Default(Period.monthly) final Period period,

    /// budget difference expenses
    @Default(0) final double totalExpensesSum,
    @Default(0) final double totalIncomesSum,

    /// calculated from specific dates && !isRegular
    @Default(0) final double oneTimeIncomesSum,

    /// calculated from specific dates && !isRegular
    @Default(0) final double oneTimeExpensesSum,

    /// is difference between regularIncomesSum + regularExpensesSum,
    /// divided by quantity of days left in the period setted in
    /// the income date.
    @Default(0) final double dailyBudget,
    @Default(Envs.isAmountsTaxFree) final bool isTaxFree,
    @Default(false) final bool countWithTransfers,
    @Default(TaskType.personal) final TaskType taskType,
  }) = _UiPredictionState;
}

class UiPredictionNotifier extends ValueNotifier<UiPredictionState>
    with HasLocalApis, HasNotifiers, HasDistributors {
  UiPredictionNotifier()
      : super(UiPredictionState(selectedDate: DateTime.now()));
  bool get _amountsTaxFree => Envs.isAmountsTaxFree;
  final timelineNotifier = UiTimelineNotifier(
    state: UiTimelineState.create(
      presentationType: UiPresentationType.day,
      initialDate: DateTime.now(),
    ),
  );
  Future<void> onLoad() async {
    value = UiPredictionState(selectedDate: DateTime.now());
    _recalculateSums();
  }

  void _recalculateSums() {
    _recalculateTotalExpensesSum();
    _recalculateTotalIncomesSum();
  }

  void onSelectedPeriodChanged(final Period period) {
    value = value.copyWith(period: period);
    _recalculateSums();
  }

  DateTime get _startDate => value.selectedDate.toDayBeginning;
  DateTime get _endDate => _startDate.add(value.period.duration).toDayEnd;

  @override
  void dispose() {
    timelineNotifier.dispose();
    super.dispose();
  }

  DateTime get selectedDate => value.selectedDate;

  void onSelectedDateChanged(final DateTime newDate) {
    value = value.copyWith(selectedDate: newDate);
    _recalculateSums();
  }

  // TODO(arenukvern): make dependent from period
  double getExpensePredictionFor(final DateTime date) => 0;

  Future<void> removeBudget(final BudgetId budgetId) async {
    await manualBudgetsLocalApi.deleteBudget(budgetId);
    budgetsDistributor.deleteBudget(budgetId);
  }

  Future<void> upsertBudget(
    final Budget budget, {
    final bool isNew = false,
  }) async {
    await manualBudgetsLocalApi.upsertBudget(budget);
    budgetsDistributor.upsertBudget(budget);
  }

  Future<void> upsertTransaction(final TransactionEditorResult result) async {
    final (:transaction, :scheduledTransaction) = result;
    await transactionsLocalApi.upsertTransaction(transaction);

    if (scheduledTransaction.isSet) {
      await scheduledTransactionsLocalApi.upsertScheduledTransaction(
        scheduledTransaction,
      );
    }
    switch (transaction.type) {
      case TransactionType.expense:
        _recalculateTotalExpensesSum();
      case TransactionType.income:
        _recalculateTotalIncomesSum();
      case TransactionType.transferIn:
      case TransactionType.transferOut:
      // TODO(arenukvern): implement
    }
  }

  Future<void> upsertIncome(final Transaction income) async {
    await transactionsLocalApi.upsertTransaction(income);

    _recalculateTotalIncomesSum();
  }

  /// Calculates the total expense as the difference between all budgets
  /// for the given dates.
  ///
  /// [startDate] and [endDate] are used to filter the budgets within the
  /// specified period.
  /// The total expense is calculated by summing up the amounts of all
  /// budgets within this period.
  ///
  /// Returns the total expense as a tuple with balance, expense, and income.
  TransactionsBalanceRecord _calculateTotalBudgetExpense({
    required final DateTime startDate,
    required final DateTime endDate,
  }) {
    manualBudgetsLocalApi.
    final relevantBudgets = value.budgets
        .where(
          (final budget) =>
              budget.date.isBefore(endDate) || budget.date == endDate,
        )
        .toList()
      ..sort((final a, final b) => b.date.compareTo(a.date));
    if (relevantBudgets.isEmpty) return (balance: 0, expense: 0, income: 0);

    final DateTime effectiveStartDate;
    final closestBudgets =
        relevantBudgets.where((final budget) => !budget.date.isAfter(endDate));
    // Find the budget closest to startDate.dayEnd
    final Budget closestBudget;
    if (closestBudgets.isEmpty) {
      closestBudget = Budget(date: endDate);
    } else if (closestBudgets.length == 1) {
      closestBudget = closestBudgets.first;
    } else {
      closestBudget = closestBudgets.reduce((final a, final b) {
        final aDiff = a.date.difference(endDate).abs();
        final bDiff = b.date.difference(endDate).abs();
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
            budget.date.isBefore(endDate) && budget.date.isAfter(startDate),
      );
      if (olderBudget != null) {
        relevantBudgets.add(olderBudget);
      }
    }
    relevantBudgets.sort((final a, final b) => a.date.compareTo(b.date));
    if (relevantBudgets.isEmpty) return (balance: 0, expense: 0, income: 0);
    if (relevantBudgets.length == 1) {
      final budget = relevantBudgets.first;
      final amount = budget.input.amount(taxFree: _amountsTaxFree);
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
        relevantBudgets.first.input.amount(taxFree: _amountsTaxFree);

    for (int i = 1; i < relevantBudgets.length; i++) {
      final difference =
          relevantBudgets[i].input.amount(taxFree: _amountsTaxFree) -
              previousAmount;
      if (difference < 0) {
        expense += difference.abs();
      } else {
        income += difference;
      }
      previousAmount =
          relevantBudgets[i].input.amount(taxFree: _amountsTaxFree);
    }

    // If the period starts after the last budget, consider it as an expense
    if (startDate.isAfter(relevantBudgets.last.date)) {
      expense += relevantBudgets.last.input.amount(taxFree: _amountsTaxFree);
    }

    return (
      balance: relevantBudgets.last.input.amount(taxFree: _amountsTaxFree),
      expense: expense,
      income: income,
    );
  }

  void _recalculateTotalExpensesSum() {
    final (balance: _, expense: expenses, income: _) =
        _calculateTotalBudgetExpense(
      startDate: _startDate,
      endDate: _endDate,
    );
    final oneTimeIncomesSum = _recalculateOneTimeTransactionsSum(
      startDate: _startDate,
      endDate: _endDate,
      isTaxFree: value.isTaxFree,
      transactionType: TransactionType.expense,
    );
    final oneTimeTransactionsSum = _recalculateOneTimeTransactionsSum(
      startDate: _startDate,
      endDate: _endDate,
      isTaxFree: value.isTaxFree,
      transactionType: TransactionType.transferOut,
    );
    final oneTimeSum = value.countWithTransfers
        ? oneTimeIncomesSum + oneTimeTransactionsSum
        : oneTimeIncomesSum;

    value = value.copyWith(
      totalExpensesSum: expenses > oneTimeSum ? expenses : oneTimeSum,
      oneTimeExpensesSum: oneTimeSum,
    );
  }

  void _recalculateTotalIncomesSum() {
    final (balance: _, expense: _, :income) = _calculateTotalBudgetExpense(
      startDate: _startDate,
      endDate: _endDate,
    );
    final oneTimeIncomesSum = _recalculateOneTimeTransactionsSum(
      startDate: _startDate,
      endDate: _endDate,
      isTaxFree: value.isTaxFree,
      transactionType: TransactionType.income,
    );
    final oneTimeTransactionsSum = _recalculateOneTimeTransactionsSum(
      startDate: _startDate,
      endDate: _endDate,
      isTaxFree: value.isTaxFree,
      transactionType: TransactionType.transferIn,
    );
    final oneTimeSum = value.countWithTransfers
        ? oneTimeIncomesSum + oneTimeTransactionsSum
        : oneTimeIncomesSum;
    value = value.copyWith(
      totalIncomesSum: income > oneTimeSum ? income : oneTimeSum,
      oneTimeIncomesSum: oneTimeSum,
    );
  }

  double _recalculateOneTimeTransactionsSum({
    required final DateTime startDate,
    required final DateTime endDate,
    required final bool isTaxFree,
    required final TransactionType transactionType,
  }) =>
      switch (transactionType) {
        TransactionType.income => value.incomes,
        TransactionType.expense => value.expenses,
        TransactionType.transferIn => [],
        TransactionType.transferOut => [],
      }
          .where(
            (final transaction) =>
                !transaction.isRegular &&
                transaction.transactionDate.isAfter(startDate) &&
                transaction.transactionDate.isBefore(endDate),
          )
          .fold(
            0,
            (final sum, final transaction) =>
                sum + transaction.input.amount(taxFree: isTaxFree),
          );
}

/// Extension on [DateTime] to provide a method for getting the
/// date without time.
extension DateTimeWithoutTime on DateTime {}

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

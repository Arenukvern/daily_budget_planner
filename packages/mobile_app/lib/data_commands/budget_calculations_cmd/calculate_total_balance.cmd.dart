import 'package:mobile_app/common_imports.dart';

/// balance = expenses + income
/// for example:
/// if expense = -150, income = 50
/// balance = -150 + 50 = -100
typedef TransactionsBalanceRecord = ({
  double balance,
  double expense,
  double income
});

typedef CalculateTotalBalanceCmdParams = ({
  DateTime startDate,
  Period period,
});

extension CalculateTotalBalanceCmdParamsX on CalculateTotalBalanceCmdParams {
  DateTime get endDate => startDate.add(period.duration);
}

class CalculateTotalBalanceCmd with HasResources, HasLocalApis {
  const CalculateTotalBalanceCmd();
  Future<void> execute(final CalculateTotalBalanceCmdParams params) async {
    final (:balance, :expense, :income) = await _calculateTotalBalance(params);
    totalSumResource
      ..balance = balance
      ..expensesSum = expense
      ..incomesSum = income;
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
  Future<TransactionsBalanceRecord> _calculateTotalBalance(
    final CalculateTotalBalanceCmdParams params,
  ) async {
    const emptyResult = (balance: .0, expense: .0, income: .0);
    final taxFree = predictionConfigResource.isTaxFree;
    final (:startDate, :period) = params;
    final endDate = params.endDate;
    final relevantBudgets = await manualBudgetsLocalApi.getAllBudgetsForPeriod(
      startDate: startDate,
      period: period,
    );

    //  ..sort((final a, final b) => b.date.compareTo(a.date));
    if (relevantBudgets.isEmpty) return emptyResult;

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
      final oldestBudget =
          await manualBudgetsLocalApi.getOldestBudgetBetweenDates(
        startDate: startDate,
        endDate: endDate,
      );
      if (oldestBudget != null) {
        relevantBudgets.add(oldestBudget);
      }
    }
    relevantBudgets.sort((final a, final b) => a.date.compareTo(b.date));
    if (relevantBudgets.isEmpty) return emptyResult;
    if (relevantBudgets.length == 1) {
      final budget = relevantBudgets.first;
      final amount = budget.input.amount(taxFree: taxFree);
      if (budget.date.isBefore(effectiveStartDate) ||
          budget.date == effectiveStartDate) {
        return (
          balance: amount,
          expense: .0,
          income: .0,
        );
      }
      return (
        balance: amount,
        expense: .0,
        income: amount,
      );
    }

    double expense = 0;
    double income = 0;
    double previousAmount =
        relevantBudgets.first.input.amount(taxFree: taxFree);

    for (int i = 1; i < relevantBudgets.length; i++) {
      final difference =
          relevantBudgets[i].input.amount(taxFree: taxFree) - previousAmount;
      if (difference < 0) {
        expense += difference.abs();
      } else {
        income += difference;
      }
      previousAmount = relevantBudgets[i].input.amount(taxFree: taxFree);
    }

    // If the period starts after the last budget, consider it as an expense
    if (startDate.isAfter(relevantBudgets.last.date)) {
      expense += relevantBudgets.last.input.amount(taxFree: taxFree);
    }

    return (
      balance: relevantBudgets.last.input.amount(taxFree: taxFree),
      expense: expense,
      income: income,
    );
  }
}

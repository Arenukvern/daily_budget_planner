/// balance = expenses + income
/// for example:
/// if expense = -150, income = 50
/// balance = -150 + 50 = -100
typedef TransactionsBalanceRecord = ({
  double balance,
  double expense,
  double income
});

class CalculateTotalBalanceCmd {
  void execute() {
    final totalBalance = _calculateTotalBalance();
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
  TransactionsBalanceRecord _calculateTotalBalance({
    required final DateTime startDate,
    required final DateTime endDate,
  }) {
    final relevantBudgets = manualBudgetsLocalApi.getBudgetForPeriod(
      startDate: startDate,
      period: value.period,
      pageLimit: (page: 1, limit: 100),
    );

    //  ..sort((final a, final b) => b.date.compareTo(a.date));
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
}

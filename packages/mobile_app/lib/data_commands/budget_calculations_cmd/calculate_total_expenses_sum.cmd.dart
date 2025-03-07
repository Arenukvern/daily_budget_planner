class CalculateTotalExpensesSumCmd {
  void execute() {
    final totalExpensesSum = _calculateTotalExpensesSum();
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
}

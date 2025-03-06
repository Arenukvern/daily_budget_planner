class CalculateTotalIncomesSumCmd {
  void execute() {
    final totalIncomesSum = _calculateTotalIncomesSum();
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
}

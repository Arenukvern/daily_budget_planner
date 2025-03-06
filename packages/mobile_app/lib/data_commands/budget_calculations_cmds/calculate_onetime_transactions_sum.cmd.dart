class CalculateOnetimeTransactionsSumCmd {
  void execute() {
    final onetimeTransactionsSum = _calculateOnetimeTransactionsSum();
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

class UpsertTransactionCommand {
  void execute() {
    final transaction = _upsertTransaction();
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
}

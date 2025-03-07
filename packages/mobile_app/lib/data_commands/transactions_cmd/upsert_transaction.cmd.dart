import 'package:mobile_app/common_imports.dart';

class UpsertTransactionCommand with HasLocalApis {
  const UpsertTransactionCommand();

  Future<void> execute(final TransactionEditorResult result) async {
    final (:transaction, :scheduledTransaction) = result;
    await transactionsLocalApi.upsertTransaction(transaction);

    if (scheduledTransaction.isSet) {
      await scheduledTransactionsLocalApi.upsertScheduledTransaction(
        scheduledTransaction,
      );
    }
    // TODO(arenukvern): description

    // switch (transaction.type) {
    //   case TransactionType.expense:
    //     _recalculateTotalExpensesSum();
    //   case TransactionType.income:
    //     _recalculateTotalIncomesSum();
    //   case TransactionType.transferIn:
    //   case TransactionType.transferOut:
    //   // TODO(arenukvern): implement
    // }
  }
}

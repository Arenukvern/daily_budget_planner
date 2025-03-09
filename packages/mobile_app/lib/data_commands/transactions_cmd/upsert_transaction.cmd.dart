import 'package:mobile_app/common_imports.dart';

class UpsertTransactionCommand with HasResources, HasLocalApis {
  const UpsertTransactionCommand();

  Future<void> execute({
    required final TransactionEditorResult result,
    final TaskId taskId = TaskId.empty,
  }) async {
    final (:transaction, :scheduledTransaction) = result;
    final updatedTransaction = transaction.copyWith(taskId: taskId);
    final updatedScheduledTransaction = scheduledTransaction.copyWith(
      taskId: taskId,
    );
    await transactionsLocalApi.upsertTransaction(updatedTransaction);

    if (updatedScheduledTransaction.isSet) {
      await scheduledTransactionsLocalApi.upsertScheduledTransaction(
        updatedScheduledTransaction,
      );
    }

    tasksTransactionsResource.upsertTransaction(
      transaction: updatedTransaction,
      scheduledTransaction: updatedScheduledTransaction,
    );

    transactionsConfigResource.lastUpdatedTransactionDate =
        updatedTransaction.transactionDate;
  }
}

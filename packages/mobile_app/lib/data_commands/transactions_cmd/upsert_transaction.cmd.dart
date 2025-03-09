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
    final isPlanned = updatedScheduledTransaction.isSet;
    if (isPlanned) {
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

    /// executing calculations
    if (isPlanned) {
      const CalculatePlannedSumCmd().execute((
        period: predictionConfigResource.period,
        startAt: predictionConfigResource.startDate,
        transactionType: updatedTransaction.type,
      ));
    } else {
      await const CalculateOnetimeTransactionsSumCmd().execute((
        startDate: updatedTransaction.transactionDate,
        endDate: updatedTransaction.transactionDate,
        transactionType: updatedTransaction.type,
      ));
      await const CalculateBudgetBalanceCmd().execute((
        startDate: updatedTransaction.transactionDate,
        period: predictionConfigResource.period,
      ));
    }
  }
}

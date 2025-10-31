import 'package:mobile_app/common_imports.dart';

class RemoveTransactionCommand with HasLocalApis, HasResources {
  const RemoveTransactionCommand();
  Future<void> execute({
    required final TransactionId transactionId,
    required final TaskId taskId,
  }) async {
    final transaction = await transactionsLocalApi.getTransaction(
      transactionId,
    );
    await transactionsLocalApi.removeTransaction(transactionId);
    await scheduledTransactionsLocalApi.deleteScheduledTransaction(
      transactionId,
    );
    tasksTransactionsResource.removeTransaction(
      taskId: taskId,
      transactionId: transactionId,
    );

    incomeTransactionsResource.remove(transactionId);
    expenseTransactionsResource.remove(transactionId);
    transferInTransactionsResource.remove(transactionId);
    transferOutTransactionsResource.remove(transactionId);

    if (taskId.isNotEmpty) {
      const CalculatePlannedSumCmd().execute((
        period: predictionConfigResource.period,
        startAt: predictionConfigResource.startDate,
        transactionType: transaction.type,
      ));
    } else {
      await const CalculateBudgetBalanceCmd().execute((
        period: predictionConfigResource.period,
        startDate: predictionConfigResource.startDate,
      ));
    }
  }
}

import 'package:mobile_app/common_imports.dart';

class RemoveTransactionCommand with HasLocalApis, HasResources {
  const RemoveTransactionCommand();
  Future<void> execute({
    required final TransactionId transactionId,
    required final TaskId? taskId,
  }) async {
    await transactionsLocalApi.removeTransaction(transactionId);
    await scheduledTransactionsLocalApi.deleteScheduledTransaction(
      transactionId,
    );
    tasksTransactionsResource.removeTransaction(
      taskId: taskId,
      transactionId: transactionId,
    );
  }
}

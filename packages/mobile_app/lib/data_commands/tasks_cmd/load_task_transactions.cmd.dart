import 'package:mobile_app/common_imports.dart';

class LoadTaskTransactionsCommand with HasResources, HasLocalApis {
  const LoadTaskTransactionsCommand();
  Future<void> execute({
    required final TaskId taskId,
    required final DateTime startDate,
    required final Period period,
  }) async {
    final scheduledTransactions = await scheduledTransactionsLocalApi
        .getScheduledTransactionsByTaskId(
          taskId: taskId,
          startedAt: startDate,
          endedAt: startDate.add(period.duration),
        );
    final transactions = await transactionsLocalApi.getTransactionsByTaskId(
      taskId,
    );
    tasksTransactionsResource.setTaskTransactions(
      taskId: taskId,
      scheduledTransactions: scheduledTransactions,
      transactions: transactions,
    );
  }
}

import 'package:mobile_app/common_imports.dart';

class UpsertTaskCommand with HasResources, HasLocalApis {
  const UpsertTaskCommand();
  Future<void> execute(final Task task) async {
    final _ = switch (task.transactionType) {
      TaskTransactionType.income => incomeTasksResource,
      TaskTransactionType.expense => expenseTasksResource,
    }..upsert(task.id, task);
    await tasksLocalApi.upsertTask(task);
  }
}

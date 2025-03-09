import 'package:mobile_app/common_imports.dart';

class UpsertTaskCommand with HasResources, HasLocalApis {
  const UpsertTaskCommand();
  Future<void> execute(final Task task) async {
    final list = switch (task.transactionType) {
      TaskTransactionType.income => tasksResource.incomeTasks,
      TaskTransactionType.expense => tasksResource.expenseTasks,
    };
    final updatedList = list.upsert(task, (final t) => t.id == task.id);
    final tasksLoader = switch (task.transactionType) {
      TaskTransactionType.income => tasksResource.setIncomeTasks,
      TaskTransactionType.expense => tasksResource.setExpenseTasks,
    };
    final tasksType = transactionsConfigResource.tasksType;
    tasksLoader(tasks: updatedList, taskType: tasksType);
    await tasksLocalApi.upsertTask(task);
    tasksResource.upsertTask(task);
  }
}

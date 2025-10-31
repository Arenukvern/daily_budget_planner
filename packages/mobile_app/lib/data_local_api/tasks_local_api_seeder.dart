part of 'db_apis/task_local_api_isar.dart';

final class TasksLocalApiSeeder {
  TasksLocalApiSeeder._();
  static List<Task> getIncomeTasks(final TaskType taskType) {
    final List<Task> seedTasks = switch (taskType) {
      TaskType.personal =>
        PersonalIncomeTaskType.values
            .map(
              (final e) => Task(
                id: TaskId.create(),
                title: e.name,
                type: taskType,
                personalIncomeType: e,
              ),
            )
            .toList(),
      // TODO(arenukvern): description
      TaskType.business => [],
    };
    return seedTasks;
  }

  static List<Task> getExpenseTasks(final TaskType taskType) {
    final List<Task> seedTasks = switch (taskType) {
      TaskType.personal =>
        PersonalExpenseTaskType.values
            .map(
              (final e) => Task(
                id: TaskId.create(),
                title: e.name,
                type: taskType,
                personalExpenseType: e,
                transactionType: TaskTransactionType.expense,
              ),
            )
            .toList(),
      // TODO(arenukvern): description
      TaskType.business => [],
    };
    return seedTasks;
  }
}

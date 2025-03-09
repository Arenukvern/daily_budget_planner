import 'package:mobile_app/common_imports.dart';

class LoadTasksCommand with HasResources, HasLocalApis {
  const LoadTasksCommand();
  Future<void> execute() async {
    await _loadIncomeTasks();
    await _loadExpenseTasks();
  }

  TaskType get _tasksType => transactionsConfigResource.tasksType;

  Future<void> _loadIncomeTasks() async {
    final incomeTasks = await tasksLocalApi.getIncomeTasks(
      taskType: _tasksType,
    );
    tasksResource.setIncomeTasks(tasks: incomeTasks, taskType: _tasksType);
  }

  Future<void> _loadExpenseTasks() async {
    final expenseTasks = await tasksLocalApi.getExpenseTasks(
      taskType: _tasksType,
    );
    tasksResource.setExpenseTasks(tasks: expenseTasks, taskType: _tasksType);
  }
}

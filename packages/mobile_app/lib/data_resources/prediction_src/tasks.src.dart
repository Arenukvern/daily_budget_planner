import 'package:mobile_app/common_imports.dart';

@stateDistributor
class TasksResource extends ChangeNotifier {
  var _incomeTasks = <Task>[].unmodifiable;
  var _expenseTasks = <Task>[].unmodifiable;

  List<Task> get incomeTasks => _incomeTasks;
  List<Task> get expenseTasks => _expenseTasks;

  void upsertTask(final Task task) {
    final updatedTasks =
        switch (task.transactionType) {
          TaskTransactionType.income => [..._incomeTasks, task],
          TaskTransactionType.expense => [..._expenseTasks, task],
        }.unmodifiable;
    final _ = switch (task.transactionType) {
      TaskTransactionType.expense => _expenseTasks = updatedTasks,
      TaskTransactionType.income => _incomeTasks = updatedTasks,
    };
    notifyListeners();
  }

  void setIncomeTasks({
    required final List<Task> tasks,
    required final TaskType taskType,
  }) {
    assert(tasks.isNotEmpty, 'tasks is empty');

    /// filtering non active categories
    _incomeTasks =
        tasks
            .where((final type) {
              final personalIncomeType = type.personalIncomeType;
              final isVisible =
                  type.type == taskType &&
                      personalIncomeType == PersonalIncomeTaskType.salary ||
                  personalIncomeType == PersonalIncomeTaskType.cashback ||
                  personalIncomeType == PersonalIncomeTaskType.reselling ||
                  personalIncomeType == PersonalIncomeTaskType.gifts;
              return isVisible;
            })
            .toList()
            .unmodifiable;
    notifyListeners();
  }

  void setExpenseTasks({
    required final List<Task> tasks,
    required final TaskType taskType,
  }) {
    assert(tasks.isNotEmpty, 'tasks is empty');

    _expenseTasks =
        tasks
            .where((final type) {
              final isVisible = type.type == taskType;
              return isVisible;
            })
            .toList()
            .unmodifiable;
    notifyListeners();
  }

  Task getTaskById(
    final TaskId id, {
    required final TaskTransactionType transactionType,
  }) =>
      (switch (transactionType) {
        TaskTransactionType.income => incomeTasks.firstWhereOrNull(
          (final task) => task.id == id,
        ),
        TaskTransactionType.expense => expenseTasks.firstWhereOrNull(
          (final task) => task.id == id,
        ),
      }) ??
      Task.empty;

  List<Task> getTasks(final TaskTransactionType transactionType) =>
      switch (transactionType) {
        TaskTransactionType.income => incomeTasks,
        TaskTransactionType.expense => expenseTasks,
      };
}

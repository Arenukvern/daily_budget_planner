import 'package:mobile_app/common_imports.dart';

class LoadTasksCommand with HasResources, HasLocalApis {
  const LoadTasksCommand();
  Future<void> execute() async {
    await Future.wait([_loadIncomeTasks(), _loadExpenseTasks()]);
    Future<void> loadById(final TaskId taskId) =>
        const LoadTaskTransactionsCommand().execute(
          taskId: taskId,
          startDate: predictionConfigResource.startDate,
          period: predictionConfigResource.period,
        );

    incomeTasksResource.forEach(loadById);
    expenseTasksResource.forEach(loadById);
  }

  TaskType get _tasksType => transactionsConfigResource.tasksType;

  Future<void> _loadIncomeTasks() async {
    final incomeTasks = await tasksLocalApi.getIncomeTasks(
      taskType: _tasksType,
    );
    assert(incomeTasks.isNotEmpty, 'tasks is empty');

    /// filtering non active categories
    final filteredIncomeTasks =
        incomeTasks
            .where((final type) {
              final personalIncomeType = type.personalIncomeType;
              final isVisible =
                  type.type == _tasksType &&
                      personalIncomeType == PersonalIncomeTaskType.salary ||
                  personalIncomeType == PersonalIncomeTaskType.cashback ||
                  personalIncomeType == PersonalIncomeTaskType.reselling ||
                  personalIncomeType == PersonalIncomeTaskType.gifts;
              return isVisible;
            })
            .toList()
            .unmodifiable;
    incomeTasksResource.assignAllOrdered(filteredIncomeTasks);
  }

  Future<void> _loadExpenseTasks() async {
    final expenseTasks = await tasksLocalApi.getExpenseTasks(
      taskType: _tasksType,
    );
    expenseTasksResource.assignAllOrdered(expenseTasks);
  }
}

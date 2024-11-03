import 'package:mobile_app/common_imports.dart';

class TasksNotifier extends ChangeNotifier {
  final _incomeTasks = PersonalIncomeTaskType.values
      .map(
        (final type) => Task(
          title: type.name,
          id: TaskId.create(),
        ),
      )
      .toList();

  final _expenseTasks = PersonalExpenseTaskType.values
      .map(
        (final type) => Task(
          title: type.name,
          id: TaskId.create(),
          transactionType: TaskTransactionType.expense,
        ),
      )
      .toList();

  List<Task> getTasks(final TaskTransactionType transactionType) =>
      switch (transactionType) {
        TaskTransactionType.income => _incomeTasks,
        TaskTransactionType.expense => _expenseTasks,
      };
  List<Transaction> getTransactionsByTask(final Task task) => [];

  /// 1. removes [transaction] from task
  /// 2. removes [transaction] from transactions
  void removeTransaction(final Transaction transaction) {
    // TODO(arenukvern): implement
  }
}

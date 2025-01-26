import 'package:mobile_app/common_imports.dart';

typedef UiTransactionsSchedulesRecord = ({
  List<ScheduledTransaction> scheduledTransactions,
  Map<TransactionId, Transaction> transactions
});

class TasksNotifier extends ChangeNotifier
    with HasLocalApis, HasStates, HasDistributors {
  // TODO(arenukvern): cache somewere else
  DateTime? _lastUpdatedTransactionDate;
  DateTime? get lastUpdatedTransactionDate => _lastUpdatedTransactionDate;
  set lastUpdatedTransactionDate(final DateTime? value) {
    _lastUpdatedTransactionDate = value;
    notifyListeners();
  }

  // TODO(arenukvern): move to different state
  final tasksType = TaskType.personal;

  Future<void> loadTasks() async {
    await _loadIncomeTasks();
    await _loadExpenseTasks();
  }

  Future<void> _loadIncomeTasks() async {
    final incomeTasks = await tasksLocalApi.getIncomeTasks(taskType: tasksType);
    tasksDistributor.loadIncomeTasks(
      tasks: incomeTasks,
      taskType: tasksType,
    );
  }

  Future<void> _loadExpenseTasks() async {
    final expenseTasks =
        await tasksLocalApi.getExpenseTasks(taskType: tasksType);
    tasksDistributor.loadExpenseTasks(
      tasks: expenseTasks,
      taskType: tasksType,
    );
  }

  Future<void> loadTransactionsForTask({
    required final Task task,
    required final DateTime startDate,
    required final Period period,
  }) async {
    final scheduledTransactions =
        await scheduledTransactionsLocalApi.getScheduledTransactionsByTaskId(
      taskId: task.id,
      startedAt: startDate,
      endedAt: startDate.add(period.duration),
    );
    final transactions =
        await transactionsLocalApi.getTransactionsByTaskId(task.id);
    transactionsDistributor.loadTransactionsForTask(
      task: task,
      scheduledTransactions: scheduledTransactions,
      transactions: transactions,
    );
  }

  Future<void> removeTransaction({
    required final Transaction transaction,
    required final Task task,
  }) async {
    await scheduledTransactionsLocalApi
        .deleteScheduledTransaction(transaction.id);
    await transactionsLocalApi.deleteTransaction(transaction.id);
    transactionsDistributor.removeTransaction(
      transaction: transaction,
      task: task,
    );
  }

  Future<void> upsertTask(final Task task) async {
    final list = switch (task.transactionType) {
      TaskTransactionType.income => tasksDistributor.incomeTasks,
      TaskTransactionType.expense => tasksDistributor.expenseTasks,
    };
    final updatedList = list.upsert(task, (final t) => t.id == task.id);
    final tasksLoader = switch (task.transactionType) {
      TaskTransactionType.income => tasksDistributor.loadIncomeTasks,
      TaskTransactionType.expense => tasksDistributor.loadExpenseTasks,
    };
    tasksLoader(tasks: updatedList, taskType: tasksType);
    await tasksLocalApi.upsertTask(task);
    tasksDistributor.upsertTask(task);
  }

  Future<void> upsertTransaction({
    required final TransactionEditorResult result,
    required final Task task,
  }) async {
    final updatedTransaction = result.transaction.copyWith(
      taskId: task.id,
    );
    final updatedScheduledTransaction = result.scheduledTransaction.copyWith(
      taskId: task.id,
    );
    lastUpdatedTransactionDate = updatedTransaction.transactionDate;
    transactionsDistributor.upsertTransaction(
      transaction: updatedTransaction,
      scheduledTransaction: updatedScheduledTransaction,
      task: task,
    );
    await transactionsLocalApi.upsertTransaction(updatedTransaction);
    await scheduledTransactionsLocalApi
        .upsertScheduledTransaction(updatedScheduledTransaction);
  }
}

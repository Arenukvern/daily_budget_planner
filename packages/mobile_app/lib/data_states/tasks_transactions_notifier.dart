import 'package:mobile_app/common_imports.dart';

@stateDistributor
class TasksTransactionsDistributor with ChangeNotifier {
  TasksTransactionsDistributor();
  var _transactions = <TransactionId, Transaction>{}.unmodifiable;
  var _tasksTransactions = <TaskId, List<ScheduledTransaction>>{}.unmodifiable;

  UiTransactionsSchedulesRecord getTransactionsByTaskId(final TaskId taskId) {
    final scheduledTransactions = _tasksTransactions[taskId] ?? [];
    final transactions = <TransactionId, Transaction>{};
    for (final e in scheduledTransactions) {
      final transaction = _transactions[e.transactionId];
      if (transaction == null) continue;
      transactions[e.transactionId] = transaction;
    }
    return (
      transactions: transactions,
      scheduledTransactions: scheduledTransactions,
    );
  }

  void removeTransaction({
    required final Transaction transaction,
    required final Task? task,
  }) {
    final updatedTransactions = {..._transactions}..remove(transaction.id);
    _transactions = updatedTransactions.unmodifiable;
    if (task == null) return;
    final updatedTasksTransactions = {
      ..._tasksTransactions,
      task.id: [
        ...?_tasksTransactions[task.id]?.where(
          (final element) => element.transactionId != transaction.id,
        ),
      ],
    };
    _tasksTransactions = updatedTasksTransactions.unmodifiable;
    notifyListeners();
  }

  void upsertTransaction({
    required final Transaction transaction,
    required final ScheduledTransaction scheduledTransaction,
    required final Task task,
  }) {
    _transactions =
        {..._transactions, transaction.id: transaction}.unmodifiable;
    final updatedTasksTransactions = {
      ..._tasksTransactions,
      task.id: [
        ...?_tasksTransactions[task.id],
        scheduledTransaction,
      ],
    }.unmodifiable;
    _tasksTransactions = updatedTasksTransactions.unmodifiable;
    notifyListeners();
  }

  void loadTransactionsForTask({
    required final Task task,
    required final List<ScheduledTransaction> scheduledTransactions,
    required final List<Transaction> transactions,
  }) {
    _tasksTransactions = {
      ..._tasksTransactions,
      task.id: scheduledTransactions,
    }.unmodifiable;
    _transactions = {
      ..._transactions,
      ...transactions.toMap(
        toKey: (final transaction) => transaction.id,
        toValue: (final transaction) => transaction,
      ),
    }.unmodifiable;
    notifyListeners();
  }
}

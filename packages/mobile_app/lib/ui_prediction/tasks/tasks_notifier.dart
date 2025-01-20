import 'package:mobile_app/common_imports.dart';

typedef UiTransactionsSchedulesRecord = ({
  List<ScheduledTransaction> scheduledTransactions,
  Map<TransactionId, Transaction> transactions
});

class TasksNotifier extends ChangeNotifier {
  var _incomeTasks = PersonalIncomeTaskType.values
      .mapIndexed(
        (final index, final type) => Task(
          title: type.name,
          id: TaskId.create(),
          status: type == PersonalIncomeTaskType.salary ||
                  type == PersonalIncomeTaskType.cashback ||
                  type == PersonalIncomeTaskType.reselling ||
                  type == PersonalIncomeTaskType.gifts
              ? TaskStatus.visible
              : TaskStatus.hidden,
        ),
      )
      .toList();

  var _expenseTasks = PersonalExpenseTaskType.values
      .mapIndexed(
        (final index, final type) => Task(
          title: type.name,
          id: TaskId.create(),
          transactionType: TaskTransactionType.expense,
        ),
      )
      .toList();

  /// these transactions are different, because they will be used
  /// as constructors for real transactions.
  var _transactions = <TransactionId, Transaction>{};

  Task getTaskById(
    final TaskId id, {
    required final TaskTransactionType transactionType,
  }) =>
      (switch (transactionType) {
        TaskTransactionType.income => _incomeTasks.firstWhereOrNull(
            (final task) => task.id == id,
          ),
        TaskTransactionType.expense => _expenseTasks.firstWhereOrNull(
            (final task) => task.id == id,
          ),
      }) ??
      Task.empty;

  List<Task> getTasks(final TaskTransactionType transactionType) =>
      switch (transactionType) {
        TaskTransactionType.income => _incomeTasks,
        TaskTransactionType.expense => _expenseTasks,
      }
          .where((final task) => task.status == TaskStatus.visible)
          .toList();

  double getPlannedIncomeSum({
    required final DateTime startAt,
    required final Period period,
    required final TransactionType transactionType,
  }) =>
      switch (transactionType) {
        TransactionType.income => _incomeTasks,
        TransactionType.expense => _expenseTasks,
        TransactionType.transferIn => throw UnsupportedError(''),
        TransactionType.transferOut => throw UnsupportedError(''),
      }
          .map((final task) {
        final (:scheduledTransactions, :transactions) =
            getTransactionsByTask(task);

        return scheduledTransactions.sumForPeriod(
          allTransactions: transactions,
          period: period,
          startAt: startAt,
        );
      }).fold(0, (final a, final b) => a + b);

  UiTransactionsSchedulesRecord getTransactionsByTask(final Task task) => (
        transactions: task.transactionIds
            .map((final id) => _transactions[id])
            .nonNulls
            .toMap(toKey: (final e) => e.id, toValue: (final e) => e),
        scheduledTransactions: task.schedules,
      );

  /// 1. removes [transaction] from task
  /// 2. removes [transaction] from transactions
  void removeTransaction(final Transaction transaction, final Task task) {
    _transactions = {..._transactions}..remove(transaction.id);
    final updatedTask = task.copyWith(
      schedules: task.schedules
          .where((final s) => s.transactionId != transaction.id)
          .toList(),
    );
    _upsertTask(updatedTask);
  }

  void _upsertTask(final Task task) {
    final list = switch (task.transactionType) {
      TaskTransactionType.income => _incomeTasks,
      TaskTransactionType.expense => _expenseTasks,
    };
    final updatedList = list.upsert(task, (final t) => t.id == task.id);
    final _ = switch (task.transactionType) {
      TaskTransactionType.income => _incomeTasks = updatedList,
      TaskTransactionType.expense => _expenseTasks = updatedList,
    };

    notifyListeners();
  }

  Future<void> upsertTransaction({
    required final TransactionEditorResult result,
    required final Task task,
  }) async {
    final updatedTransaction = result.transaction.copyWith(
      taskId: task.id,
    );

    final updatedTask = task.copyWith(
      schedules: [
        ...task.schedules,
        ScheduledTransaction(
          transactionId: updatedTransaction.id,
          schedule: result.schedule,
        ),
      ],
    );

    _transactions = {..._transactions}..[updatedTransaction.id] =
        updatedTransaction;
    _upsertTask(updatedTask);
  }
}

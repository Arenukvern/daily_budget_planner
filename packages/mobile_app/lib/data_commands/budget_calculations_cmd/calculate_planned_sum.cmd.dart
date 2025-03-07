import 'package:mobile_app/common_imports.dart';

typedef CalculatePlannedSumCmdParams = ({
  DateTime startAt,
  Period period,
  TransactionType transactionType,
});

class CalculatePlannedSumCmd with HasResources {
  const CalculatePlannedSumCmd();
  // tasksNotifier.getPlannedExpensesSum(
  //   startAt: selectedDate,
  //   period: period,
  //   transactionType: TransactionType.expense,
  // ).toStringAsFixed(2)
  void execute(final CalculatePlannedSumCmdParams params) {
    final tasks = switch (params.transactionType) {
      TransactionType.income => <Task>[],
      TransactionType.expense => <Task>[],
      TransactionType.transferIn => throw UnsupportedError(''),
      TransactionType.transferOut => throw UnsupportedError(''),
    };
    final sum = _calculatePlannedSum(params, tasks: tasks);
    final _ = switch (params.transactionType) {
      TransactionType.income => plannedSumsResource.incomesSum = sum,
      TransactionType.expense => plannedSumsResource.expensesSum = sum,
      TransactionType.transferIn => throw UnimplementedError(),
      TransactionType.transferOut => throw UnimplementedError(),
    };
  }

  double _calculatePlannedSum(
    final CalculatePlannedSumCmdParams params, {
    required final List<Task> tasks,
  }) =>
      tasks.map((final task) {
        final (:scheduledTransactions, :transactions) =
            tasksTransactionsResource.getTransactionsByTaskId(task.id);

        return scheduledTransactions.sumForPeriod(
          allTransactions: transactions,
          period: params.period,
          startAt: params.startAt,
        );
      }).fold(0, (final a, final b) => a + b);
}

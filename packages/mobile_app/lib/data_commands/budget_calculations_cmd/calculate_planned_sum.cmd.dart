import 'package:mobile_app/common_imports.dart';

class CalculatePlannedSumCmd {
  const CalculatePlannedSumCmd();
  // tasksNotifier.getPlannedExpensesSum(
  //   startAt: selectedDate,
  //   period: period,
  //   transactionType: TransactionType.expense,
  // ).toStringAsFixed(2)
  void execute({
    required final DateTime startAt,
    required final Period period,
    required final TransactionType transactionType,
  }) {
    final sum = switch (transactionType) {
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
  }
}

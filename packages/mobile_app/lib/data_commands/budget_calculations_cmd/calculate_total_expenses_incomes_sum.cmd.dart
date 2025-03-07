import 'package:mobile_app/common_imports.dart';

class CalculateTotalExpensesIncomesSumCmd with HasResources {
  Future<void> calculateAllExpensesIncomes({
    required final CalculateTotalBalanceCmdParams dateParams,
  }) async {
    await const CalculateTotalBalanceCmd().execute(dateParams);
    await Future.wait([
      calculateByType(
        dateParams: dateParams,
        transactionType: TransactionType.expense,
      ),
      calculateByType(
        dateParams: dateParams,
        transactionType: TransactionType.income,
      ),
    ]);
  }

  /// [CalculateTotalBalanceCmd] should be called before this method.
  Future<void> calculateByType({
    required final CalculateTotalBalanceCmdParams dateParams,
    required final TransactionType transactionType,
  }) async {
    await const CalculateTotalBalanceCmd().execute(dateParams);
    final budgetSum = totalSumResource.expensesSum;

    const CalculateOnetimeTransactionsSumCmd().execute(
      (
        startDate: dateParams.startDate,
        endDate: dateParams.endDate,
        transactionType: transactionType,
      ),
    );
    final onetimeSum = oneTimeSumsResource.expensesSum;

    const CalculateOnetimeTransactionsSumCmd().execute(
      (
        startDate: dateParams.startDate,
        endDate: dateParams.endDate,
        transactionType: switch (transactionType) {
          TransactionType.expense => TransactionType.transferOut,
          TransactionType.income => TransactionType.transferIn,
          TransactionType.transferIn ||
          TransactionType.transferOut =>
            throw ArgumentError.value(
              'Only expenses and incomes can be calculated by type. '
              '$transactionType is not allowed.',
            ),
        },
      ),
    );
    final transferOutSum = oneTimeSumsResource.transferOutSum;
    final oneTimeSum = predictionConfigResource.countWithTransfers
        ? onetimeSum + transferOutSum
        : onetimeSum;
    final maxSum = budgetSum > oneTimeSum ? budgetSum : oneTimeSum;
    final _ = switch (transactionType) {
      TransactionType.expense => totalSumResource.expensesSum = maxSum,
      TransactionType.income => totalSumResource.incomesSum = maxSum,
      TransactionType.transferIn ||
      TransactionType.transferOut =>
        throw ArgumentError.value(
          'Only expenses and incomes can be calculated by type. '
          '$transactionType is not allowed.',
        ),
    };
  }
}

import 'package:mobile_app/common_imports.dart';

typedef CalculateOnetimeTransactionsSumCmdParams =
    ({DateTime startDate, DateTime endDate, TransactionType transactionType});

class CalculateOnetimeTransactionsSumCmd with HasResources {
  const CalculateOnetimeTransactionsSumCmd();
  Future<void> execute(
    final CalculateOnetimeTransactionsSumCmdParams params,
  ) async {
    final transactions = switch (params.transactionType) {
      TransactionType.income => incomeTransactionsResource,
      TransactionType.expense => expenseTransactionsResource,
      TransactionType.transferIn => transferInTransactionsResource,
      TransactionType.transferOut => transferOutTransactionsResource,
    };
    final sum = _calculateOneTimeTransactionsSum(
      params,
      transactions: transactions.orderedValues,
    );
    final _ = switch (params.transactionType) {
      TransactionType.income => oneTimeSumsResource.incomesSum = sum,
      TransactionType.expense => oneTimeSumsResource.expensesSum = sum,
      TransactionType.transferIn => oneTimeSumsResource.transferInSum = sum,
      TransactionType.transferOut => oneTimeSumsResource.transferOutSum = sum,
    };
  }

  double _calculateOneTimeTransactionsSum(
    final CalculateOnetimeTransactionsSumCmdParams params, {
    required final List<Transaction> transactions,
  }) {
    final isTextFree = predictionConfigResource.isTaxFree;
    return transactions
        .where(
          (final transaction) =>
              !transaction.isRegular &&
              transaction.transactionDate.isAfter(params.startDate) &&
              transaction.transactionDate.isBefore(params.endDate),
        )
        .fold(
          0,
          (final sum, final transaction) =>
              sum + transaction.input.amount(taxFree: isTextFree),
        );
  }
}

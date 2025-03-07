import 'package:mobile_app/common_imports.dart';

typedef CalculateOnetimeTransactionsSumCmdParams = ({
  DateTime startDate,
  DateTime endDate,
  bool isTaxFree,
  TransactionType transactionType,
});

class CalculateOnetimeTransactionsSumCmd with HasResources {
  void execute(final CalculateOnetimeTransactionsSumCmdParams params) {
    // TODO(arenukvern): description
    final transactions = switch (params.transactionType) {
      TransactionType.income => <Transaction>[],
      TransactionType.expense => <Transaction>[],
      TransactionType.transferIn => <Transaction>[],
      TransactionType.transferOut => <Transaction>[],
    };
    final sum = _calculateOneTimeTransactionsSum(
      params,
      transactions: transactions,
    );
    final _ = switch (params.transactionType) {
      TransactionType.income => oneTimeSumsResource.incomesSum = sum,
      TransactionType.expense => oneTimeSumsResource.expensesSum = sum,
      TransactionType.transferIn => throw UnimplementedError(),
      TransactionType.transferOut => throw UnimplementedError(),
    };
  }

  double _calculateOneTimeTransactionsSum(
    final CalculateOnetimeTransactionsSumCmdParams params, {
    required final List<Transaction> transactions,
  }) =>
      transactions
          .where(
            (final transaction) =>
                !transaction.isRegular &&
                transaction.transactionDate.isAfter(params.startDate) &&
                transaction.transactionDate.isBefore(params.endDate),
          )
          .fold(
            0,
            (final sum, final transaction) =>
                sum +
                transaction.input
                    .amount(taxFree: predictionConfigResource.isTaxFree),
          );
}

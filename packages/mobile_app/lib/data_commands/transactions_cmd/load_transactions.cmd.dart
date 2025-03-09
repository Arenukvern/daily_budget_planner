import 'package:mobile_app/common_imports.dart';

class LoadTransactionsCmd with HasResources, HasLocalApis {
  const LoadTransactionsCmd();
  Future<void> execute() async {
    await Future.wait(TransactionType.values.map(loadByType));
  }

  Future<void> loadByType(final TransactionType type) async {
    final transactions = await transactionsLocalApi.getAllTransactionsByType(
      type: type,
    );
    final _ = switch (type) {
      TransactionType.income => incomeTransactionsResource.assignAllOrdered(
        transactions,
      ),
      TransactionType.expense => expenseTransactionsResource.assignAllOrdered(
        transactions,
      ),
      TransactionType.transferIn => transferInTransactionsResource
          .assignAllOrdered(transactions),
      TransactionType.transferOut => transferOutTransactionsResource
          .assignAllOrdered(transactions),
    };
  }
}

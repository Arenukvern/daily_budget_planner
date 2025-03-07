import 'package:mobile_app/common_imports.dart';

class RemoveTransactionCommand with HasLocalApis, HasResources {
  const RemoveTransactionCommand();
  Future<void> execute(final TransactionId transactionId) async {
    await transactionsLocalApi.deleteTransaction(transactionId);
    // TODO(arenukvern): description
    // transactionsResource.remove(transactionId);
  }
}

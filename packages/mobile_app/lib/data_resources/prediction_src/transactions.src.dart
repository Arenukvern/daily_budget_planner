import 'package:mobile_app/common_imports.dart';

/// transactions without tasks
@stateDistributor
class IncomeTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  IncomeTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}

/// transactions without tasks
@stateDistributor
class ExpenseTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  ExpenseTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}

/// transactions without tasks
@stateDistributor
class TransferInTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  TransferInTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}

/// transactions without tasks
@stateDistributor
class TransferOutTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {
  TransferOutTransactionsResource()
    : super(toKey: (final transaction) => transaction.id);
}

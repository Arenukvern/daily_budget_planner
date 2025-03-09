import 'package:mobile_app/common_imports.dart';

/// transactions without tasks
class IncomeTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {}

/// transactions without tasks
class ExpenseTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {}

/// transactions without tasks
class TransferInTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {}

/// transactions without tasks
class TransferOutTransactionsResource
    extends OrderedMapNotifier<TransactionId, Transaction> {}

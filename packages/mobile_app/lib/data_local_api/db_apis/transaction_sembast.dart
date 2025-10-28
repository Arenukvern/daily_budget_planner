import 'package:from_json_to_json/from_json_to_json.dart';
import 'package:mobile_app/common_imports.dart';

/// {@template transaction_sembast_collection}
/// Sembast collection model for storing [Transaction] data.
/// Handles persistence of transactions and their related schedules.
///
/// This collection maintains relationships between:
/// - [Transaction]
///
/// @ai When generating code for this collection, ensure proper handling of
/// data serialization and maintain referential integrity with
/// related collections.
/// {@endtemplate}
class TransactionSembastCollection
    extends SembastContainer<Transaction, TransactionId> {
  TransactionSembastCollection({required super.item});

  /// Creates instance from Sembast Map
  factory TransactionSembastCollection.fromMap(
    final Map<String, dynamic> map,
  ) => TransactionSembastCollection(
    item: Transaction.fromJson(
      jsonDecodeMap(map[SembastContainer.keys.jsonData]),
    ),
  );

  /// Converts a domain [Transaction] model to [TransactionSembastCollection]
  factory TransactionSembastCollection.fromDomain(
    final Transaction transaction,
  ) => TransactionSembastCollection(item: transaction);

  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'transactionDate': item.transactionDate,
    'taskId': item.taskId,
    'type': item.type,
  };

  @override
  TransactionId get id => item.id;

  @override
  SembastDataMap getJson() => item.toJson();
}

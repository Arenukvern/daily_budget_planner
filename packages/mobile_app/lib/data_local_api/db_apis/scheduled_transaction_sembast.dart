import 'package:from_json_to_json/from_json_to_json.dart';
import 'package:mobile_app/common_imports.dart';

/// {@template scheduled_transaction_sembast_collection}
/// Sembast collection model for storing [ScheduledTransaction] data.
/// Handles persistence of scheduled transactions and their related data.
///
/// This collection maintains relationships between:
/// - [ScheduledTransaction]
/// - [TransactionSchedule]
///
/// @ai When generating code for this collection, ensure proper handling of
/// data serialization and maintain referential integrity with
/// related collections.
/// {@endtemplate}
class ScheduledTransactionSembastCollection
    extends SembastContainer<ScheduledTransaction, TransactionId> {
  /// Creates a [ScheduledTransactionSembastCollection] instance
  ScheduledTransactionSembastCollection({required super.item});

  /// Creates instance from Sembast Map
  factory ScheduledTransactionSembastCollection.fromMap(
    final Map<String, dynamic> map,
  ) => ScheduledTransactionSembastCollection(
    item: ScheduledTransaction.fromJson(
      jsonDecodeMap(map[SembastContainer.keys.jsonData]),
    ),
  );

  /// Converts a domain [ScheduledTransaction] model to [ScheduledTransactionSembastCollection]
  factory ScheduledTransactionSembastCollection.fromDomain(
    final ScheduledTransaction scheduledTransaction,
  ) => ScheduledTransactionSembastCollection(item: scheduledTransaction);

  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'schedule': item.schedule.toJson(),
    'transactionId': item.transactionId,
    'taskId': item.taskId,
  };

  @override
  TransactionId get id => item.transactionId;

  @override
  Map<String, dynamic> getJson() => item.toJson();
}

part of 'isar.dart';

/// {@template isar_scheduled_transaction_collection}
/// Isar collection model for storing [ScheduledTransaction] data.
/// Handles persistence of scheduled transactions and their related
/// transactions.
///
/// This collection maintains relationships between:
/// - [ScheduledTransaction]
///
/// @ai When generating code for this collection, ensure proper handling of
/// embedded objects and maintain referential integrity with
/// related collections.
/// {@endtemplate}
@collection
class IsarScheduledTransactionCollection with IsarIdMixin {
  IsarScheduledTransactionCollection();

  factory IsarScheduledTransactionCollection.fromDomain(
    final ScheduledTransaction scheduledTransaction,
  ) {
    final scheduledTransactionJson = scheduledTransaction.toJson();

    return IsarScheduledTransactionCollection()
      ..id = scheduledTransaction.transactionId.value
      ..scheduledTransactionJson = jsonEncode(scheduledTransactionJson);
  }

  String scheduledTransactionJson = '';

  ScheduledTransaction toDomain() {
    final scheduledTransactionJsonMap = jsonDecodeMap(scheduledTransactionJson);
    return ScheduledTransaction.fromJson(scheduledTransactionJsonMap);
  }
}

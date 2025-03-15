import 'dart:convert';

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';

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
class ScheduledTransactionSembastCollection with SembastIdMixin<TransactionId> {
  /// Creates a [ScheduledTransactionSembastCollection] instance
  ScheduledTransactionSembastCollection();

  /// Creates instance from Sembast Map
  factory ScheduledTransactionSembastCollection.fromMap(
    final Map<String, dynamic> map,
  ) =>
      ScheduledTransactionSembastCollection()
        ..id = TransactionId.fromJson(map['id'])
        ..scheduledTransactionJson = map['scheduledTransactionJson'] as String
        ..transactionId = TransactionId.fromJson(map['transactionId'])
        ..taskId = TaskId.fromJson(map['taskId'])
        ..schedule = TransactionSchedule.fromJson(
          jsonDecodeMap(map['schedule'] as String),
        );

  /// Converts a domain [ScheduledTransaction] model to [ScheduledTransactionSembastCollection]
  factory ScheduledTransactionSembastCollection.fromDomain(
    final ScheduledTransaction scheduledTransaction,
  ) {
    final scheduledTransactionJson = scheduledTransaction.toJson();

    return ScheduledTransactionSembastCollection()
      ..id = scheduledTransaction.transactionId
      ..scheduledTransactionJson = jsonEncode(scheduledTransactionJson)
      ..transactionId = scheduledTransaction.transactionId
      ..taskId = scheduledTransaction.taskId
      ..schedule = scheduledTransaction.schedule;
  }

  @override
  TransactionId id = TransactionId.empty;

  String scheduledTransactionJson = '';

  /// Associated transaction ID
  TransactionId transactionId = TransactionId.empty;

  /// Associated task ID
  TaskId taskId = TaskId.empty;

  /// Transaction schedule
  late TransactionSchedule schedule;

  /// Converts to Map for Sembast storage
  Map<String, dynamic> toMap() => {
    'id': id,
    'scheduledTransactionJson': scheduledTransactionJson,
    'transactionId': transactionId,
    'taskId': taskId,
    'schedule': jsonEncode(schedule.toJson()),
  };

  /// Converts [ScheduledTransactionSembastCollection] to domain [ScheduledTransaction] model
  ScheduledTransaction toDomain() {
    final scheduledTransactionJsonMap = jsonDecodeMap(scheduledTransactionJson);
    return ScheduledTransaction.fromJson(scheduledTransactionJsonMap);
  }
}

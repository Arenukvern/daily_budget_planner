// ignore_for_file: omit_obvious_property_types

import 'dart:convert';

import 'package:from_json_to_json/from_json_to_json.dart';
import 'package:mobile_app/common_imports.dart';

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
// @collection
class ScheduledTransactionIsarCollection with IsarIdMixin {
  ScheduledTransactionIsarCollection();

  factory ScheduledTransactionIsarCollection.fromDomain(
    final ScheduledTransaction scheduledTransaction,
  ) {
    final scheduledTransactionJson = scheduledTransaction.toJson();

    return ScheduledTransactionIsarCollection()
      ..id = scheduledTransaction.transactionId.value
      ..startedAt = scheduledTransaction.schedule.startedAt
      ..endedAt = scheduledTransaction.schedule.endedAt
      ..scheduledTransactionJson = jsonEncode(scheduledTransactionJson)
      ..taskId = scheduledTransaction.taskId.value;
  }

  String scheduledTransactionJson = '';
  String taskId = '';

  DateTime? startedAt;
  DateTime? endedAt;

  ScheduledTransaction toDomain() {
    final scheduledTransactionJsonMap = jsonDecodeMap(scheduledTransactionJson);
    return ScheduledTransaction.fromJson(scheduledTransactionJsonMap);
  }
}

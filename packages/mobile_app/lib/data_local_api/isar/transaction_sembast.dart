import 'dart:convert';

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';

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
class TransactionSembastCollection with SembastIdMixin<TransactionId> {
  /// Creates a [TransactionSembastCollection] instance
  TransactionSembastCollection();

  /// Creates instance from Sembast Map
  factory TransactionSembastCollection.fromMap(
    final Map<String, dynamic> map,
  ) =>
      TransactionSembastCollection()
        ..id = TransactionId.fromJson(map['id'])
        ..transactionJson = map['transactionJson'] as String
        ..transactionDate = DateTime.parse(map['transactionDate'] as String)
        ..taskId = map['taskId'] as String
        ..type = TransactionType.values.byName(map['type'] as String);

  /// Converts a domain [Transaction] model to [TransactionSembastCollection]
  factory TransactionSembastCollection.fromDomain(
    final Transaction transaction,
  ) {
    final transactionJson = transaction.toJson();

    return TransactionSembastCollection()
      ..id = transaction.id
      ..transactionDate = transaction.transactionDate
      ..transactionJson = jsonEncode(transactionJson)
      ..taskId = transaction.taskId.value
      ..type = transaction.type;
  }

  @override
  TransactionId id = TransactionId.empty;

  String transactionJson = '';

  /// Transaction date in UTC
  DateTime transactionDate = dateTimeNowUtc();

  /// Associated task ID
  String taskId = '';

  /// Transaction type (expense/income)
  TransactionType type = TransactionType.expense;

  /// Converts to Map for Sembast storage
  Map<String, dynamic> toMap() => {
    'id': id,
    'transactionJson': transactionJson,
    'transactionDate': transactionDate.toIso8601String(),
    'taskId': taskId,
    'type': type.name,
  };

  /// Converts [TransactionSembastCollection] to domain [Transaction] model
  Transaction toDomain() {
    final transactionJsonMap = jsonDecodeMap(transactionJson);
    return Transaction.fromJson(transactionJsonMap);
  }
}

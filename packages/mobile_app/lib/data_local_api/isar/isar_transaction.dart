part of 'isar.dart';

/// {@template transaction_isar_collection}
/// Isar collection model for storing [Transaction] data.
/// Handles persistence of transactions and their related schedules.
///
/// This collection maintains relationships between:
/// - [Transaction]
///
/// @ai When generating code for this collection, ensure proper handling of
/// embedded objects and maintain referential integrity with
/// related collections.
/// {@endtemplate}
@collection
class TransactionIsarCollection with IsarIdMixin {
  /// Creates a [TransactionIsarCollection] instance
  TransactionIsarCollection();

  /// Converts a domain [Transaction] model to [TransactionIsarCollection]
  factory TransactionIsarCollection.fromDomain(final Transaction transaction) {
    final transactionJson = transaction.toJson();

    return TransactionIsarCollection()
      ..id = transaction.id.value
      ..transactionDate = transaction.transactionDate
      ..transactionJson = jsonEncode(transactionJson)
      ..taskId = transaction.taskId.value
      ..type = transaction.type;
  }

  String transactionJson = '';

  /// Transaction date in UTC
  @Index()
  DateTime transactionDate = dateTimeNowUtc();

  /// Associated task ID
  @Index()
  String taskId = '';

  /// Transaction type (expense/income)
  TransactionType type = TransactionType.expense;

  /// Converts [TransactionIsarCollection] to domain [Transaction] model
  Transaction toDomain() {
    final transactionJsonMap = jsonDecodeMap(transactionJson);
    return Transaction.fromJson(transactionJsonMap);
  }
}

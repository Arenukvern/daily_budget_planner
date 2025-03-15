import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';
import 'package:mobile_app/data_local_api/db_apis/transaction_sembast.dart';
import 'package:mobile_app/data_local_api/transaction_repository.dart';
import 'package:sembast/sembast.dart' hide Transaction;

/// Repository implementation for transactions using Sembast
class SembastTransactionRepository implements TransactionRepository {
  /// Creates a [SembastTransactionRepository] instance
  SembastTransactionRepository(this._db);

  final SembastDb _db;

  @override
  Future<void> delete(final TransactionId id) async {
    await _db.transactions.record(id.value).delete(_db.db);
  }

  @override
  Future<Transaction?> get(final TransactionId id) async {
    final record = await _db.transactions.record(id.value).get(_db.db);
    if (record == null) return null;
    return TransactionSembastCollection.fromMap(record).toDomain();
  }

  @override
  Future<List<Transaction>> getAll() async {
    final records = await _db.transactions.find(_db.db);
    return records
        .map(
          (final record) =>
              TransactionSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  @override
  Future<List<Transaction>> getAllByTaskId(final TaskId taskId) async {
    final finder = Finder(
      filter: Filter.equals('taskId', taskId.value),
      sortOrders: [SortOrder('transactionDate', false)],
    );
    final records = await _db.transactions.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              TransactionSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  @override
  Future<List<Transaction>> getAllByDateRange({
    required final DateTime startDate,
    required final DateTime endDate,
  }) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.equals('taskId', ''),
        Filter.greaterThanOrEquals(
          'transactionDate',
          startDate.toIso8601String(),
        ),
        Filter.lessThanOrEquals('transactionDate', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('transactionDate', false)],
    );
    final records = await _db.transactions.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              TransactionSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  @override
  Future<List<Transaction>> getAllByType(final TransactionType type) async {
    final finder = Finder(
      filter: Filter.equals('type', type.name),
      sortOrders: [SortOrder('transactionDate', false)],
    );
    final records = await _db.transactions.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              TransactionSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  @override
  Future<void> save(final Transaction transaction) async {
    final collection = TransactionSembastCollection.fromDomain(transaction);
    await _db.transactions
        .record(transaction.id.value)
        .put(_db.db, collection.toMap());
  }

  @override
  Future<void> saveAll(final List<Transaction> transactions) async {
    await _db.db.transaction((final txn) async {
      for (final transaction in transactions) {
        final collection = TransactionSembastCollection.fromDomain(transaction);
        await _db.transactions
            .record(transaction.id.value)
            .put(txn, collection.toMap());
      }
    });
  }

  @override
  Future<void> deleteAll() async {
    await _db.transactions.delete(_db.db);
  }
}

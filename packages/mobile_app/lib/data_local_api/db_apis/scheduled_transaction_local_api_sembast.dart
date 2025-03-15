import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';
import 'package:mobile_app/data_local_api/db_apis/scheduled_transaction_sembast.dart';
import 'package:sembast/sembast.dart';

/// Repository implementation for scheduled transactions using Sembast
class SembastScheduledTransactionRepository {
  /// Creates a [SembastScheduledTransactionRepository] instance
  SembastScheduledTransactionRepository(this._db);

  final SembastDb _db;

  Future<void> delete(final TransactionId id) async {
    await _db.scheduledTransactions.record(id.value).delete(_db.db);
  }

  Future<ScheduledTransaction?> get(final TransactionId id) async {
    final record = await _db.scheduledTransactions.record(id.value).get(_db.db);
    if (record == null) return null;
    return ScheduledTransactionSembastCollection.fromMap(record).toDomain();
  }

  Future<List<ScheduledTransaction>> getAll() async {
    final records = await _db.scheduledTransactions.find(_db.db);
    return records
        .map(
          (final record) =>
              ScheduledTransactionSembastCollection.fromMap(
                record.value,
              ).toDomain(),
        )
        .toList();
  }

  Future<List<ScheduledTransaction>> getAllByTaskId({
    required final TaskId taskId,
    required final DateTime startedAt,
    required final DateTime endedAt,
  }) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.equals('taskId', taskId.value),
        Filter.lessThan('schedule.startedAt', endedAt.toIso8601String()),
        Filter.or([
          Filter.isNull('schedule.endedAt'),
          Filter.greaterThan('schedule.endedAt', startedAt.toIso8601String()),
        ]),
      ]),
      sortOrders: [SortOrder('id', false)],
    );
    final records = await _db.scheduledTransactions.find(
      _db.db,
      finder: finder,
    );
    return records
        .map(
          (final record) =>
              ScheduledTransactionSembastCollection.fromMap(
                record.value,
              ).toDomain(),
        )
        .toList();
  }

  Future<void> save(final ScheduledTransaction scheduledTransaction) async {
    final collection = ScheduledTransactionSembastCollection.fromDomain(
      scheduledTransaction,
    );
    await _db.scheduledTransactions
        .record(scheduledTransaction.transactionId.value)
        .put(_db.db, collection.toMap());
  }

  Future<void> saveAll(
    final List<ScheduledTransaction> scheduledTransactions,
  ) async {
    await _db.db.transaction((final txn) async {
      for (final scheduledTransaction in scheduledTransactions) {
        final collection = ScheduledTransactionSembastCollection.fromDomain(
          scheduledTransaction,
        );
        await _db.scheduledTransactions
            .record(scheduledTransaction.transactionId.value)
            .put(txn, collection.toMap());
      }
    });
  }

  Future<void> deleteAll() async {
    await _db.scheduledTransactions.delete(_db.db);
  }
}

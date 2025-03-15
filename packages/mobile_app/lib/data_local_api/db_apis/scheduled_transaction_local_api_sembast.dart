import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';
import 'package:mobile_app/data_local_api/db_apis/scheduled_transaction_sembast.dart';
import 'package:sembast/sembast.dart';

/// Repository implementation for scheduled transactions using Sembast
final class SembastScheduledTransactionsLocalApi extends ComplexLocalApi {
  /// Creates a [SembastScheduledTransactionsLocalApi] instance
  SembastScheduledTransactionsLocalApi(this._db);
  final SembastDb _db;

  Future<void> upsertScheduledTransaction(
    final ScheduledTransaction scheduledTransaction,
  ) async {
    try {
      await _db.db.transaction((final txn) async {
        final model = ScheduledTransactionSembastCollection.fromDomain(
          scheduledTransaction,
        );
        await _db.scheduledTransactions
            .record(scheduledTransaction.transactionId)
            .put(txn, model.toMap());
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create scheduled transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> deleteScheduledTransaction(final TransactionId id) async {
    try {
      await _db.scheduledTransactions.record(id).delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete scheduled transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<ScheduledTransaction> getScheduledTransaction(
    final TransactionId id,
  ) async {
    try {
      final record = await _db.scheduledTransactions.record(id).get(_db.db);
      if (record == null) return ScheduledTransaction.empty;
      return ScheduledTransactionSembastCollection.fromMap(record).item;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get scheduled transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<List<ScheduledTransaction>> getAllScheduledTransactions() async {
    try {
      final records = await _db.scheduledTransactions.find(_db.db);
      return records
          .map(
            (final record) =>
                ScheduledTransactionSembastCollection.fromMap(
                  record.value,
                ).item,
          )
          .toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all scheduled transactions',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<List<ScheduledTransaction>> getScheduledTransactionsByTaskId({
    required final TaskId taskId,
    required final DateTime startedAt,
    required final DateTime endedAt,
  }) async {
    try {
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
                ).item,
          )
          .toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get scheduled transactions by task ID',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> deleteAllScheduledTransactions() async {
    try {
      await _db.scheduledTransactions.delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all transactions',
        error: e,
        stackTrace: s,
      );
    }
  }
}

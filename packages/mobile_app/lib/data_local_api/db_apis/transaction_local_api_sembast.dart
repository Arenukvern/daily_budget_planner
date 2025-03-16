import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db_apis/transaction_sembast.dart';
import 'package:sembast/sembast.dart' hide Transaction;

/// Repository implementation for transactions using Sembast
final class TransactionsLocalApiSembast extends ComplexLocalApi
    with HasComplexLocalDbs
    implements TransactionsLocalApi {
  /// Creates a [SembastTransactionsLocalApi] instance
  TransactionsLocalApiSembast();
  SembastDb get _db => sembastDb;

  @override
  Future<void> upsertTransaction(final Transaction transaction) async {
    try {
      await _db.db.transaction((final txn) async {
        final model = TransactionSembastCollection.fromDomain(transaction);
        await _db.transactions.record(transaction.id).put(txn, model.toMap());
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> upsertTransactions(final List<Transaction> transactions) async {
    try {
      await _db.db.transaction((final txn) async {
        for (final transaction in transactions) {
          final model = TransactionSembastCollection.fromDomain(transaction);
          await _db.transactions.record(transaction.id).put(txn, model.toMap());
        }
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to upsert transactions',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> removeTransaction(final TransactionId id) async {
    try {
      await _db.transactions.record(id).delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<Transaction> getTransaction(final TransactionId id) async {
    try {
      final record = await _db.transactions.record(id).get(_db.db);
      if (record == null) return Transaction.empty;
      return TransactionSembastCollection.fromMap(record).item;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<Transaction>> getAllTransactionsByType({
    required final TransactionType type,
  }) async {
    try {
      final finder = Finder(
        filter: Filter.equals('type', type.name),
        sortOrders: [SortOrder('transactionDate', false)],
      );
      final records = await _db.transactions.find(_db.db, finder: finder);
      return records
          .map((final r) => TransactionSembastCollection.fromMap(r.value).item)
          .toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all transactions',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<Transaction>> getTransactionsByTaskId(final TaskId taskId) async {
    try {
      final finder = Finder(
        filter: Filter.equals('taskId', taskId.value),
        sortOrders: [SortOrder('transactionDate', false)],
      );
      final records = await _db.transactions.find(_db.db, finder: finder);
      return records
          .map((final r) => TransactionSembastCollection.fromMap(r.value).item)
          .toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get transactions by task ID',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<PagingControllerPageModel<Transaction>> getTransactionsByDateRange({
    required final DateTime start,
    required final Period period,
    required final PageLimitRecord pageLimit,
  }) async {
    try {
      final end = start.addPeriod(period);
      final finder = Finder(
        filter: Filter.and([
          Filter.equals('taskId', ''),
          Filter.greaterThanOrEquals(
            'transactionDate',
            start.toIso8601String(),
          ),
          Filter.lessThanOrEquals('transactionDate', end.toIso8601String()),
        ]),
        sortOrders: [SortOrder('transactionDate', false)],
        offset: pageLimit.page * pageLimit.limit,
        limit: pageLimit.limit,
      );

      final totalCount = await _db.transactions
          .query(finder: finder)
          .count(_db.db);
      final pagesCount = (totalCount / pageLimit.limit).ceil();

      final records = await _db.transactions.find(_db.db, finder: finder);

      return PagingControllerPageModel(
        values:
            records
                .map(
                  (final r) =>
                      TransactionSembastCollection.fromMap(r.value).item,
                )
                .toList(),
        currentPage: pageLimit.page,
        pagesCount: pagesCount,
      );
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get transactions by date range',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> deleteAllTransactions() async {
    try {
      await _db.transactions.delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all transactions',
        error: e,
        stackTrace: s,
      );
    }
  }
}

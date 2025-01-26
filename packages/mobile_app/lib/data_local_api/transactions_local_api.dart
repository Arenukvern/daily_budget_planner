import 'package:isar/isar.dart';
import 'package:mobile_app/data_local_api/data_local_api.dart';
import 'package:mobile_app/data_models/data_models.dart';

/// {@template transactions_local_api}
/// Local storage implementation for managing transactions using Isar database.
///
/// This API provides CRUD operations for:
/// - [Transaction]
/// - [ScheduledTransaction]
/// - [TransactionSchedule]
///
/// Features:
/// - Data persistence with Isar
/// - Support for future model migrations
/// - Maintains data integrity during async operations
///
/// Example usage:
/// ```dart
/// final api = TransactionsLocalApi(isarDb);
/// // Create or update
/// await api.upsertTransaction(transaction);
/// // Read
/// final transaction = await api.getTransaction(id);
/// // Delete
/// await api.deleteTransaction(id);
/// ```
///
/// @ai When implementing transaction operations, ensure proper error handling
/// and maintain data consistency across related collections.
/// {@endtemplate}
final class TransactionsLocalApi extends ComplexLocalApi {
  /// Returns the Isar collection for transactions
  IsarCollection<String, TransactionIsarCollection> get _transactions =>
      isarDb.transactions;

  /// Creates a new transaction or updates an existing one
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> upsertTransaction(final Transaction transaction) async {
    try {
      isar.write((final db) {
        final model = TransactionIsarCollection.fromDomain(transaction);
        db.transactionIsarCollections.put(model);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Throws [LocalApiException] if the operation fails
  Future<void> upsertTransactions(
    final List<Transaction> transactions,
  ) async {
    try {
      isar.write((final db) {
        final models =
            transactions.map(TransactionIsarCollection.fromDomain).toList();
        db.transactionIsarCollections.putAll(models);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to upsert transactions',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteTransaction(final TransactionId id) async {
    try {
      isar.write((final db) {
        db.transactionIsarCollections.delete(id.value);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Retrieves a transaction by ID
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<Transaction> getTransaction(final TransactionId id) async {
    try {
      final model = _transactions.get(id.value);
      return model?.toDomain() ?? Transaction.empty;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Throws [LocalApiException] if the operation fails
  Future<List<Transaction>> getAllTransactions() async {
    try {
      final models = _transactions.where().findAll();
      return models.map((final e) => e.toDomain()).toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all transactions',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Throws [LocalApiException] if the operation fails
  Future<List<Transaction>> getTransactionsByTaskId(final TaskId taskId) async {
    try {
      final models =
          _transactions.where().taskIdEqualTo(taskId.value).findAll();
      return models.map((final e) => e.toDomain()).toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get transactions by task ID',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Throws [LocalApiException] if the operation fails
  Future<List<Transaction>> getTransactionsByDateRange({
    required final DateTime start,
    required final DateTime end,
  }) async {
    try {
      final models =
          _transactions.where().transactionDateBetween(start, end).findAll();
      return models.map((final e) => e.toDomain()).toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get transactions by date range',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Deletes all transactions
  ///
  /// Use with caution! This operation cannot be undone.
  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteAllTransactions() async {
    try {
      isar.write((final db) {
        db.transactionIsarCollections.clear();
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all transactions',
        error: e,
        stackTrace: s,
      );
    }
  }
}

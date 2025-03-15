// import 'package:isar/isar.dart';
import 'package:mobile_app/data_local_api/data_local_api.dart';
import 'package:mobile_app/data_models/data_models.dart';

/// {@template transactions_local_api}
/// Local storage implementation for managing transactions using Isar database.
///
/// This API provides CRUD operations for:
/// - [ScheduledTransaction]
///
/// Features:
/// - Data persistence with Isar
/// - Support for future model migrations
/// - Maintains data integrity during async operations
///
/// Example usage:
/// ```dart
/// final api = ScheduledTransactionsLocalApi(isarDb);
/// // Create or update
/// await api.upsertScheduledTransaction(scheduledTransaction);
/// // Read
/// final scheduledTransaction = await api.getScheduledTransaction(id);
/// // Delete
/// await api.deleteScheduledTransaction(id);
/// ```
///
/// @ai When implementing transaction operations, ensure proper error handling
/// and maintain data consistency across related collections.
/// {@endtemplate}
final class ScheduledTransactionsLocalApi extends ComplexLocalApi {
  /// Returns the Isar collection for scheduled transactions
  IsarCollection<String, ScheduledTransactionIsarCollection>
  get _scheduledTransactions => isarDb.scheduledTransactions;

  /// Creates a new scheduled transaction or updates an existing one
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> upsertScheduledTransaction(
    final ScheduledTransaction scheduledTransaction,
  ) async {
    try {
      isar.write((final db) {
        final model = ScheduledTransactionIsarCollection.fromDomain(
          scheduledTransaction,
        );
        db.scheduledTransactionIsarCollections.put(model);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create scheduled transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Deletes a scheduled transaction by ID
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteScheduledTransaction(final TransactionId id) async {
    try {
      isar.write((final db) {
        db.scheduledTransactionIsarCollections.delete(id.value);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete scheduled transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Retrieves a scheduled transaction by ID
  ///
  /// Returns null if not found
  /// Throws [LocalApiException] if the operation fails
  Future<ScheduledTransaction> getScheduledTransaction(
    final TransactionId id,
  ) async {
    try {
      final model = _scheduledTransactions.get(id.value);
      return model?.toDomain() ?? ScheduledTransaction.empty;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get scheduled transaction',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Retrieves all scheduled transactions
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<List<ScheduledTransaction>> getAllScheduledTransactions() async {
    try {
      final models = _scheduledTransactions.where().findAll();
      return models.map((final e) => e.toDomain()).toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all scheduled transactions',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Retrieves scheduled transactions by task ID
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<List<ScheduledTransaction>> getScheduledTransactionsByTaskId({
    required final TaskId taskId,
    required final DateTime startedAt,
    required final DateTime endedAt,
  }) async {
    try {
      final models =
          _scheduledTransactions
              .where()
              .taskIdEqualTo(taskId.value)
              .startedAtLessThan(endedAt)
              .group(
                (final q) =>
                    q.endedAtIsNull().or().endedAtGreaterThan(startedAt),
              )
              .findAll();
      return models.map((final e) => e.toDomain()).toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get scheduled transactions by task ID',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Deletes all scheduled transactions
  ///
  /// Use with caution! This operation cannot be undone.
  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteAllScheduledTransactions() async {
    try {
      isar.write((final db) {
        db.scheduledTransactionIsarCollections.clear();
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

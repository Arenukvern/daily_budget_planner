import 'package:isar/isar.dart';
import 'package:mobile_app/common_imports.dart';

/// {@template transactions_local_api}
/// Local storage implementation for managing transactions using Isar database.
/// Used to create [UiPredictionScreen].
///
/// This API provides CRUD operations for:
/// - [Budget]
///
/// Features:
/// - Data persistence with Isar
/// - Support for future model migrations
/// - Maintains data integrity during async operations
///
/// Example usage:
/// ```dart
/// final api = BudgetPredictionLocalApi(isarDb);
/// // Create or update
/// await api.upsertBudget(budget);
/// // Read
/// final budget = await api.getBudget(id);
/// // Delete
/// await api.deleteBudget(id);
/// ```
///
/// @ai When implementing transaction operations, ensure proper error handling
/// and maintain data consistency across related collections.
/// {@endtemplate}
final class ManualBudgetsLocalApi extends ComplexLocalApi {
  IsarCollection<String, BudgetIsarCollection> get _budgets => isarDb.budgets;

  /// Creates a new task or updates an existing one
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> upsertBudget(final Budget budget) async {
    try {
      final model = BudgetIsarCollection.fromDomain(budget);
      isar.write((final db) {
        db.budgetIsarCollections.put(model);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Deletes a task by ID
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteBudget(final BudgetId id) async {
    try {
      isar.write((final db) {
        db.budgetIsarCollections.delete(id.value);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Retrieves a task by ID
  ///
  /// Returns null if not found
  /// Throws [LocalApiException] if the operation fails
  Future<Budget> getBudget(final BudgetId id) async {
    try {
      final model = _budgets.get(id.value);
      return model?.toDomain() ?? Budget.empty;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Retrieves all tasks
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<PagingControllerPageModel<Budget>> getBudgetForPeriod({
    required final DateTime startDate,
    required final Period period,
    required final PageLimitRecord pageLimit,
  }) async {
    try {
      final endDate = startDate.addPeriod(period);
      final query = _budgets
          .where()
          .createdAtGreaterThanOrEqualTo(startDate)
          .createdAtLessThanOrEqualTo(endDate);

      final itemsCount = query.count();
      final pagesCount = (itemsCount / pageLimit.limit).ceil();
      final items = query.findAll(
        offset: pageLimit.page * pageLimit.limit,
        limit: pageLimit.limit,
      );

      return PagingControllerPageModel(
        values: items.map((final e) => e.toDomain()).toList(),
        currentPage: pageLimit.page,
        pagesCount: pagesCount,
      );
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all budgets',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Deletes all tasks
  ///
  /// Use with caution! This operation cannot be undone.
  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteAllBudgets() async {
    try {
      isar.write((final db) {
        db.budgetIsarCollections.clear();
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all budgets',
        error: e,
        stackTrace: s,
      );
    }
  }
}

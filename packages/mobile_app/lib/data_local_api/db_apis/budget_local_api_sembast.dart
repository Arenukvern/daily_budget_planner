import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';
import 'package:mobile_app/data_local_api/db_apis/budget_sembast.dart';
import 'package:sembast/sembast.dart';

final class SembastBudgetLocalApi extends ComplexLocalApi {
  SembastBudgetLocalApi(this._db);
  final SembastDb _db;

  Future<void> upsertBudget(final Budget budget) async {
    try {
      await _db.db.transaction((final txn) async {
        final model = BudgetSembastCollection.fromDomain(budget);
        await _db.budgets.record(budget.id).put(txn, model.toMap());
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> deleteBudget(final BudgetId id) async {
    try {
      await _db.budgets.record(id).delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<Budget> getBudget(final BudgetId id) async {
    try {
      final record = await _db.budgets.record(id).get(_db.db);
      if (record == null) return Budget.empty;
      return BudgetSembastCollection.fromMap(record).item;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get budget',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<Budget?> getOldestBudgetBetweenDates({
    required final DateTime startDate,
    required final DateTime endDate,
  }) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startDate.toIso8601String()),
        Filter.lessThanOrEquals('date', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('date')],
      limit: 1,
    );
    final record = await _db.budgets.findFirst(_db.db, finder: finder);
    if (record == null) return null;
    return BudgetSembastCollection.fromMap(record.value).item;
  }

  Future<List<Budget>> getAllBudgetsForPeriod({
    required final DateTime startDate,
    required final DateTime endDate,
  }) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startDate.toIso8601String()),
        Filter.lessThanOrEquals('date', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('date')],
    );
    final records = await _db.budgets.find(_db.db, finder: finder);
    return records
        .map(
          (final record) => BudgetSembastCollection.fromMap(record.value).item,
        )
        .toList();
  }

  Future<List<Budget>> getPaginatedBudgetForPeriod({
    required final DateTime startDate,
    required final DateTime endDate,
    required final PageLimitRecord pageLimit,
  }) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startDate.toIso8601String()),
        Filter.lessThanOrEquals('date', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('date')],
      offset: pageLimit.page * pageLimit.limit,
      limit: pageLimit.limit,
    );
    final records = await _db.budgets.find(_db.db, finder: finder);
    return records
        .map(
          (final record) => BudgetSembastCollection.fromMap(record.value).item,
        )
        .toList();
  }

  Future<void> deleteAllBudgets() async {
    try {
      await _db.budgets.delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all budgets',
        error: e,
        stackTrace: s,
      );
    }
  }

  // Other methods follow same pattern, matching ISAR interface
  // Implement getAllBudgetsForPeriod, getPaginatedBudgetForPeriod etc.
  // using Sembast query syntax but maintaining identical method signatures
}

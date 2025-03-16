import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db_apis/budget_sembast.dart';
import 'package:sembast/sembast.dart';

final class ManualBudgetsLocalApiSembast extends ComplexLocalApi
    with HasComplexLocalDbs
    implements ManualBudgetsLocalApi {
  ManualBudgetsLocalApiSembast();
  SembastDb get _db => sembastDb;

  @override
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

  @override
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

  @override
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

  @override
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

  @override
  Future<List<Budget>> getAllBudgetsForPeriod({
    required final Period period,
    required final DateTime startDate,
  }) async {
    final endDate = startDate.add(period.duration);
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

  @override
  Future<PagingControllerPageModel<Budget>> getPaginatedBudgetForPeriod({
    required final Period period,
    required final DateTime startDate,
    required final PageLimitRecord pageLimit,
  }) async {
    final endDate = startDate.add(period.duration);
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
    return PagingControllerPageModel<Budget>(
      values:
          records
              .map(
                (final record) =>
                    BudgetSembastCollection.fromMap(record.value).item,
              )
              .toList(),
      currentPage: pageLimit.page,
      pagesCount: records.length ~/ pageLimit.limit,
    );
  }

  @override
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
}

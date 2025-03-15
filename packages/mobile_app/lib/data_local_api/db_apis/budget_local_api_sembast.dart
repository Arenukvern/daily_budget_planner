import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';
import 'package:mobile_app/data_local_api/db_apis/budget_sembast.dart';
import 'package:sembast/sembast.dart';

/// Repository implementation for budgets using Sembast
class SembastBudgetRepository {
  /// Creates a [SembastBudgetRepository] instance
  SembastBudgetRepository(this._db);

  final SembastDb _db;

  Future<void> delete(final BudgetId id) async {
    await _db.budgets.record(id.value).delete(_db.db);
  }

  Future<Budget?> get(final BudgetId id) async {
    final record = await _db.budgets.record(id.value).get(_db.db);
    if (record == null) return null;
    return BudgetSembastCollection.fromMap(record).toDomain();
  }

  Future<List<Budget>> getAll() async {
    final records = await _db.budgets.find(_db.db);
    return records
        .map(
          (final record) =>
              BudgetSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  Future<List<Budget>> getAllByType(final BudgetType type) async {
    final finder = Finder(
      filter: Filter.equals('budgetType', type.name),
      sortOrders: [SortOrder('date', false)],
    );
    final records = await _db.budgets.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              BudgetSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  Future<List<Budget>> getAllByTransactionType(
    final BudgetTransactionType type,
  ) async {
    final finder = Finder(
      filter: Filter.equals('transactionType', type.name),
      sortOrders: [SortOrder('date', false)],
    );
    final records = await _db.budgets.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              BudgetSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  Future<List<Budget>> getAllByDateRange({
    required final DateTime startDate,
    required final DateTime endDate,
  }) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.greaterThanOrEquals('date', startDate.toIso8601String()),
        Filter.lessThanOrEquals('date', endDate.toIso8601String()),
      ]),
      sortOrders: [SortOrder('date', false)],
    );
    final records = await _db.budgets.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              BudgetSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
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
    return BudgetSembastCollection.fromMap(record.value).toDomain();
  }

  Future<void> save(final Budget budget) async {
    final collection = BudgetSembastCollection.fromDomain(budget);
    await _db.budgets.record(budget.id.value).put(_db.db, collection.toMap());
  }

  Future<void> saveAll(final List<Budget> budgets) async {
    await _db.db.transaction((final txn) async {
      for (final budget in budgets) {
        final collection = BudgetSembastCollection.fromDomain(budget);
        await _db.budgets.record(budget.id.value).put(txn, collection.toMap());
      }
    });
  }

  Future<void> deleteAll() async {
    await _db.budgets.delete(_db.db);
  }
}

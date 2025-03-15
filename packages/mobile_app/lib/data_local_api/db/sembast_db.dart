import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/db.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

const _sembastDbVersion = 'sembast_1';
const _dbFileName = 'daily_budget.db';

/// Sembast database implementation
final class SembastDb extends ComplexLocalDb {
  Database? _db;
  final _budgetStore = stringMapStoreFactory.store('budgets');
  final _transactionStore = stringMapStoreFactory.store('transactions');
  final _scheduledTransactionStore = stringMapStoreFactory.store(
    'scheduled_transactions',
  );
  final _taskStore = stringMapStoreFactory.store('tasks');

  Database get db =>
      _db ??
      (throw ArgumentError.value('db is not initialized. Call open first.'));

  @override
  Future<void> open() async {
    if (_db != null) return;

    if (kIsWeb) {
      _db = await databaseFactoryWeb.openDatabase(_dbFileName);
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final dbPath = join(dir.path, _dbFileName);
      _db = await databaseFactoryIo.openDatabase(dbPath);
    }
  }

  /// Store operations for budgets
  StoreRef<String, Map<String, dynamic>> get budgets => _budgetStore;

  /// Store operations for transactions
  StoreRef<String, Map<String, dynamic>> get transactions => _transactionStore;

  /// Store operations for scheduled transactions
  StoreRef<String, Map<String, dynamic>> get scheduledTransactions =>
      _scheduledTransactionStore;

  /// Store operations for tasks
  StoreRef<String, Map<String, dynamic>> get tasks => _taskStore;

  @override
  Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}

/// Mixin for handling IDs in Sembast models
mixin SembastIdMixin<T> {
  T get id;
  set id(final T value);
}

abstract class SembastContainer<T extends Object, TId extends Object>
    with SembastIdMixin<TId> {
  SembastContainer({required this.item});
  @override
  TId get id;
  T item;
  @mustCallSuper
  @mustBeOverridden
  Map<String, dynamic> toMap() => {'id': id, 'jsonData': item};
}

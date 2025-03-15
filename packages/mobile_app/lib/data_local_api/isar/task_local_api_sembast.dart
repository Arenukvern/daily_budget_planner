import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';
import 'package:mobile_app/data_local_api/isar/task_sembast.dart';
import 'package:sembast/sembast.dart';

/// Repository implementation for tasks using Sembast
class SembastTaskRepository {
  /// Creates a [SembastTaskRepository] instance
  SembastTaskRepository(this._db);

  final SembastDb _db;

  Future<void> delete(final TaskId id) async {
    await _db.tasks.record(id.value).delete(_db.db);
  }

  Future<Task?> get(final TaskId id) async {
    final record = await _db.tasks.record(id.value).get(_db.db);
    if (record == null) return null;
    return TaskSembastCollection.fromMap(record).toDomain();
  }

  Future<List<Task>> getAll() async {
    final records = await _db.tasks.find(_db.db);
    return records
        .map(
          (final record) =>
              TaskSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  Future<List<Task>> getAllByType(final TaskType type) async {
    final finder = Finder(
      filter: Filter.equals('taskType', type.name),
      sortOrders: [SortOrder('id', false)],
    );
    final records = await _db.tasks.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              TaskSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  Future<List<Task>> getAllByTransactionType(
    final TaskTransactionType type,
  ) async {
    final finder = Finder(
      filter: Filter.equals('transactionType', type.name),
      sortOrders: [SortOrder('id', false)],
    );
    final records = await _db.tasks.find(_db.db, finder: finder);
    return records
        .map(
          (final record) =>
              TaskSembastCollection.fromMap(record.value).toDomain(),
        )
        .toList();
  }

  Future<void> save(final Task task) async {
    final collection = TaskSembastCollection.fromDomain(task);
    await _db.tasks.record(task.id.value).put(_db.db, collection.toMap());
  }

  Future<void> saveAll(final List<Task> tasks) async {
    await _db.db.transaction((final txn) async {
      for (final task in tasks) {
        final collection = TaskSembastCollection.fromDomain(task);
        await _db.tasks.record(task.id.value).put(txn, collection.toMap());
      }
    });
  }

  Future<void> deleteAll() async {
    await _db.tasks.delete(_db.db);
  }
}

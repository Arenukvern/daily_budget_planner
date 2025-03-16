import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db_apis/task_sembast.dart';
import 'package:sembast/sembast.dart';

final class TasksLocalApiSembast extends ComplexLocalApi
    with HasComplexLocalDbs
    implements TasksLocalApi {
  TasksLocalApiSembast();
  SembastDb get _db => sembastDb;

  @override
  Future<void> upsertTask(final Task task) async {
    try {
      await _db.db.transaction((final txn) async {
        final model = TaskSembastCollection.fromDomain(task);
        await _db.tasks.record(task.id).put(txn, model.toMap());
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create task',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> upsertTasks(final List<Task> tasks) async {
    try {
      await _db.db.transaction((final txn) async {
        for (final task in tasks) {
          final model = TaskSembastCollection.fromDomain(task);
          await _db.tasks.record(task.id).put(txn, model.toMap());
        }
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to upsert tasks',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> deleteTask(final TaskId id) async {
    try {
      await _db.tasks.record(id).delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete task',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<Task> getTask(final TaskId id) async {
    try {
      final record = await _db.tasks.record(id).get(_db.db);
      if (record == null) return Task.empty;
      return TaskSembastCollection.fromMap(record).item;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get task',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<Task>> getIncomeTasks({required final TaskType taskType}) async {
    try {
      final finder = Finder(
        filter: Filter.and([
          Filter.equals('transactionType', TaskTransactionType.income.name),
          Filter.equals('taskType', taskType.name),
        ]),
      );

      final records = await _db.tasks.find(_db.db, finder: finder);
      final tasks =
          records
              .map((final r) => TaskSembastCollection.fromMap(r.value).item)
              .toList();

      if (tasks.isNotEmpty) return tasks;
      final seedTasks = TasksLocalApiSeeder.getIncomeTasks(taskType);
      await upsertTasks(seedTasks);
      return seedTasks;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get income tasks',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<Task>> getExpenseTasks({required final TaskType taskType}) async {
    try {
      final finder = Finder(
        filter: Filter.and([
          Filter.equals('transactionType', TaskTransactionType.expense.name),
          Filter.equals('taskType', taskType.name),
        ]),
      );

      final records = await _db.tasks.find(_db.db, finder: finder);
      final tasks =
          records
              .map((final r) => TaskSembastCollection.fromMap(r.value).item)
              .toList();

      if (tasks.isNotEmpty) return tasks;
      final seedTasks = TasksLocalApiSeeder.getExpenseTasks(taskType);
      await upsertTasks(seedTasks);
      return seedTasks;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get expense tasks',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      final records = await _db.tasks.find(_db.db);
      return records
          .map((final r) => TaskSembastCollection.fromMap(r.value).item)
          .toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all tasks',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> deleteAllTasks() async {
    try {
      await _db.tasks.delete(_db.db);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all tasks',
        error: e,
        stackTrace: s,
      );
    }
  }
}

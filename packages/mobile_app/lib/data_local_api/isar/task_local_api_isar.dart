// import 'package:isar/isar.dart';
import 'package:mobile_app/common_imports.dart';

part '../tasks_local_api_seeder.dart';

/// {@template tasks_local_api}
/// Local storage implementation for managing tasks using Isar database.
///
/// This API provides CRUD operations for:
/// - [Task]
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
/// final api = TasksLocalApi(isarDb);
/// // Create or update
/// await api.upsertTask(task);
/// // Read
/// final task = await api.getTask(id);
/// // Delete
/// await api.deleteTask(id);
/// ```
///
/// @ai When implementing task operations, ensure proper error handling
/// and maintain data consistency across related collections.
/// {@endtemplate}
final class TasksLocalApi extends ComplexLocalApi {
  /// Returns the Isar collection for tasks
  IsarCollection<String, TaskIsarCollection> get _tasks => isarDb.tasks;

  /// Creates a new task or updates an existing one
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> upsertTask(final Task task) async {
    try {
      isar.write((final db) {
        final model = TaskIsarCollection.fromDomain(task);
        db.taskIsarCollections.put(model);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create task',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<void> upsertTasks(final List<Task> tasks) async {
    try {
      isar.write((final db) {
        final models = tasks.map(TaskIsarCollection.fromDomain).toList();
        db.taskIsarCollections.putAll(models);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to upsert tasks',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Deletes a task by ID
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteTask(final TaskId id) async {
    try {
      isar.write((final db) {
        db.taskIsarCollections.delete(id.value);
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete task',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Retrieves a task by ID
  ///
  /// Returns null if not found
  /// Throws [LocalApiException] if the operation fails
  Future<Task> getTask(final TaskId id) async {
    try {
      final model = _tasks.get(id.value);
      return model?.toDomain() ?? Task.empty;
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get task',
        error: e,
        stackTrace: s,
      );
    }
  }

  Future<List<Task>> getIncomeTasks({required final TaskType taskType}) async {
    try {
      final tasks =
          _tasks
              .where()
              .transactionTypeEqualTo(TaskTransactionType.income)
              .taskTypeEqualTo(taskType)
              .findAll()
              .map((final e) => e.toDomain())
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

  Future<List<Task>> getExpenseTasks({required final TaskType taskType}) async {
    try {
      final tasks =
          _tasks
              .where()
              .transactionTypeEqualTo(TaskTransactionType.expense)
              .taskTypeEqualTo(taskType)
              .findAll()
              .map((final e) => e.toDomain())
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

  /// Retrieves all tasks
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<List<Task>> getAllTasks() async {
    try {
      final models = _tasks.where().findAll();
      return models.map((final e) => e.toDomain()).toList();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get all tasks',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Deletes all tasks
  ///
  /// Use with caution! This operation cannot be undone.
  /// Throws [LocalApiException] if the operation fails
  Future<void> deleteAllTasks() async {
    try {
      isar.write((final db) {
        db.taskIsarCollections.clear();
      });
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all tasks',
        error: e,
        stackTrace: s,
      );
    }
  }
}

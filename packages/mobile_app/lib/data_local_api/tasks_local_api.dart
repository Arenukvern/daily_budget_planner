import 'package:isar/isar.dart';
import 'package:mobile_app/data_local_api/data_local_api.dart';
import 'package:mobile_app/data_models/data_models.dart';

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
final class TasksLocalApi extends LocalApi {
  /// Returns the Isar collection for tasks
  IsarCollection<String, TaskIsarCollection> get _tasks => isarDb.tasks;

  /// Creates a new task or updates an existing one
  ///
  /// Throws [LocalApiException] if the operation fails
  Future<void> upsertTask(final Task task) async {
    try {
      final model = TaskIsarCollection.fromDomain(task);
      _tasks.put(model);
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to create task',
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
      _tasks.delete(id.value);
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
  Future<Task?> getTask(final TaskId id) async {
    try {
      final model = _tasks.get(id.value);
      return model?.toDomain();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to get task',
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
      _tasks.clear();
    } catch (e, s) {
      throw LocalApiException(
        message: 'Failed to delete all tasks',
        error: e,
        stackTrace: s,
      );
    }
  }
}

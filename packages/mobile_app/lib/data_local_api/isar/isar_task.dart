part of 'isar.dart';

/// {@template task_isar_collection}
/// Isar collection model for storing [Task] data.
/// Handles persistence of tasks and their related schedules.
///
/// This collection maintains relationships between:
/// - [Task]
/// - [ScheduledTransaction]
/// - [TransactionSchedule]
///
/// @ai When generating code for this collection, ensure proper handling of
/// embedded objects and maintain referential integrity with
/// related collections.
/// {@endtemplate}
@collection
class TaskIsarCollection with IsarIdMixin {
  /// Creates a [TaskIsarCollection] instance
  TaskIsarCollection();

  /// Converts a domain [Task] model to [TaskIsarCollection]
  factory TaskIsarCollection.fromDomain(final Task task) {
    final taskJson = task.toJson();

    return TaskIsarCollection()
      ..id = task.id.value
      ..taskType = task.type
      ..transactionType = task.transactionType
      ..personalIncomeType = task.personalIncomeType
      ..personalExpenseType = task.personalExpenseType
      ..taskJson = jsonEncode(taskJson);
  }

  /// Full task data as JSON string
  String taskJson = '';
  TaskType taskType = TaskType.personal;
  TaskTransactionType transactionType = TaskTransactionType.income;
  PersonalIncomeTaskType personalIncomeType = PersonalIncomeTaskType.salary;
  PersonalExpenseTaskType personalExpenseType = PersonalExpenseTaskType.other;

  /// Converts [TaskIsarCollection] to domain [Task] model
  Task toDomain() {
    final taskJsonMap = jsonDecodeMap(taskJson);
    return Task.fromJson(taskJsonMap);
  }
}

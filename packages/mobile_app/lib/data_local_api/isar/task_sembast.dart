import 'dart:convert';

import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/data_local_api/db/sembast_db.dart';

/// {@template task_sembast_collection}
/// Sembast collection model for storing [Task] data.
/// Handles persistence of tasks and their related data.
///
/// This collection maintains relationships between:
/// - [Task]
///
/// @ai When generating code for this collection, ensure proper handling of
/// data serialization and maintain referential integrity with
/// related collections.
/// {@endtemplate}
class TaskSembastCollection with SembastIdMixin<TaskId> {
  /// Creates a [TaskSembastCollection] instance
  TaskSembastCollection();

  /// Creates instance from Sembast Map
  factory TaskSembastCollection.fromMap(final Map<String, dynamic> map) =>
      TaskSembastCollection()
        ..id = TaskId.fromJson(map['id'])
        ..taskJson = map['taskJson'] as String
        ..taskType = TaskType.values.byName(map['taskType'] as String)
        ..transactionType = TaskTransactionType.values.byName(
          map['transactionType'] as String,
        )
        ..personalIncomeType = PersonalIncomeTaskType.values.byName(
          map['personalIncomeType'] as String,
        )
        ..personalExpenseType = PersonalExpenseTaskType.values.byName(
          map['personalExpenseType'] as String,
        );

  /// Converts a domain [Task] model to [TaskSembastCollection]
  factory TaskSembastCollection.fromDomain(final Task task) {
    final taskJson = task.toJson();

    return TaskSembastCollection()
      ..id = task.id
      ..taskJson = jsonEncode(taskJson)
      ..taskType = task.type
      ..transactionType = task.transactionType
      ..personalIncomeType = task.personalIncomeType
      ..personalExpenseType = task.personalExpenseType;
  }

  @override
  TaskId id = TaskId.empty;

  String taskJson = '';

  /// Task type (personal/business)
  TaskType taskType = TaskType.personal;

  /// Transaction type (expense/income)
  TaskTransactionType transactionType = TaskTransactionType.income;

  /// Personal income type
  PersonalIncomeTaskType personalIncomeType = PersonalIncomeTaskType.salary;

  /// Personal expense type
  PersonalExpenseTaskType personalExpenseType = PersonalExpenseTaskType.other;

  /// Converts to Map for Sembast storage
  Map<String, dynamic> toMap() => {
    'id': id,
    'taskJson': taskJson,
    'taskType': taskType.name,
    'transactionType': transactionType.name,
    'personalIncomeType': personalIncomeType.name,
    'personalExpenseType': personalExpenseType.name,
  };

  /// Converts [TaskSembastCollection] to domain [Task] model
  Task toDomain() {
    final taskJsonMap = jsonDecodeMap(taskJson);
    return Task.fromJson(taskJsonMap);
  }
}

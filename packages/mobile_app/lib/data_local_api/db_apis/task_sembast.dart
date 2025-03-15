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
class TaskSembastCollection extends SembastContainer<Task, TaskId> {
  TaskSembastCollection({required super.item});

  /// Creates instance from Sembast Map
  factory TaskSembastCollection.fromMap(final Map<String, dynamic> map) =>
      TaskSembastCollection(
        item: Task.fromJson(
          jsonDecodeMap(map[SembastContainer.keys.jsonData]!),
        ),
      );

  /// Converts a domain [Task] model to [TaskSembastCollection]
  factory TaskSembastCollection.fromDomain(final Task task) =>
      TaskSembastCollection(item: task);

  @override
  Map<String, dynamic> toMap() => {
    ...super.toMap(),
    'type': item.type.name,
    'transactionType': item.transactionType.name,

    'personalIncomeType': item.personalIncomeType.name,
    'personalExpenseType': item.personalExpenseType.name,
  };

  @override
  Map<String, dynamic> getJson() => item.toJson();

  @override
  TaskId get id => item.id;
}

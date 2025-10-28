// ignore_for_file: avoid_annotating_with_dynamic

part of 'data_models.dart';

enum TaskStatus {
  visible,
  hidden;

  factory TaskStatus.fromJson(final String json) =>
      TaskStatus.values.byName(json);
  String toJson() => name;

  bool get isActive => this == TaskStatus.visible;
  bool get isArchived => this == TaskStatus.hidden;
}

extension type const TaskId(String value) {
  factory TaskId.fromJson(final String value) => TaskId(value);
  factory TaskId.create() => TaskId(IdCreator.create());
  static const empty = TaskId('');
  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => !isEmpty;
  String toJson() => value;
}

enum TaskTransactionType {
  expense,
  income;

  factory TaskTransactionType.fromJson(final String json) =>
      TaskTransactionType.values.byName(json);
  String toJson() => name;

  TransactionType toTransactionType() => switch (this) {
    TaskTransactionType.expense => TransactionType.expense,
    TaskTransactionType.income => TransactionType.income,
  };
}

enum PersonalExpenseTaskType {
  housing,
  subscriptions,
  food,
  transport,
  familyAndFriends,
  entertainment,
  other,
}

enum PersonalIncomeTaskType {
  salary,
  cashback,
  reselling,
  gifts,
  other,
  investments,
  crypto,
}

enum TaskType { personal, business }

/// Extension type that represents a Task.
///
/// The [Task] is a value object for the main task concept,
/// modeling properties used for task tracking, categorization,
/// and financial context within the application domain. Provides
/// immutable, type-safe, and robust JSON handling.
///
/// Uses from_json_to_json for type-safe JSON handling.
///
/// Can be used to model, store, persist, and interact with tasks
/// throughout the data layer, UI, and persistence APIs.
///
/// Provides functionality to handle domain operations such as
/// serialization, value extraction, and domain equality.
extension type const Task._(Map<String, dynamic> value) {
  /// Constructs a [Task] with provided values. All fields required.
  factory Task({
    final TaskId id = TaskId.empty,
    final TaskStatus status = TaskStatus.visible,
    final String title = '',
    final String notes = '',
    final TaskType type = TaskType.personal,
    final PersonalIncomeTaskType personalIncomeType =
        PersonalIncomeTaskType.salary,
    final PersonalExpenseTaskType personalExpenseType =
        PersonalExpenseTaskType.other,
    final TaskTransactionType transactionType = TaskTransactionType.income,
    final List<CategoryId> categoryIds = const [],
  }) => Task._({
    'id': id.toJson(),
    'status': status.name,
    'title': title,
    'notes': notes,
    'type': type.name,
    'personalIncomeType': personalIncomeType.name,
    'personalExpenseType': personalExpenseType.name,
    'transactionType': transactionType.name,
    'categoryIds': categoryIds.map((final c) => c.toJson()).toList(),
  });

  /// Creates a [Task] from any json-like input. Uses safe decoding.
  factory Task.fromJson(final dynamic json) => Task._(jsonDecodeMap(json));

  /// Gets the task's unique identifier.
  TaskId get id => TaskId.fromJson(value['id']);

  /// Gets the task status (visible/hidden).
  TaskStatus get status =>
      TaskStatus.values.byName(jsonDecodeString(value['status']));

  /// Title or label of the task.
  String get title => jsonDecodeString(value['title']);

  /// Notes or description for the task.
  String get notes => jsonDecodeString(value['notes']);

  /// Task domain type (personal, business, etc).
  TaskType get type => TaskType.values.byName(jsonDecodeString(value['type']));

  /// Personal income breakdown type.
  PersonalIncomeTaskType get personalIncomeType => PersonalIncomeTaskType.values
      .byName(jsonDecodeString(value['personalIncomeType']));

  /// Personal expense breakdown type.
  PersonalExpenseTaskType get personalExpenseType => PersonalExpenseTaskType
      .values
      .byName(jsonDecodeString(value['personalExpenseType']));

  /// Whether this task is income or expense type.
  TaskTransactionType get transactionType => TaskTransactionType.values.byName(
    jsonDecodeString(value['transactionType']),
  );

  /// The list of associated category IDs for this task.
  List<CategoryId> get categoryIds => jsonDecodeListAs<String>(
    value['categoryIds'],
  ).map(CategoryId.fromJson).toList();

  /// Serializes this [Task] back to JSON.
  Map<String, dynamic> toJson() => value;

  /// Returns an empty [Task].
  static const empty = Task._({});

  /// Returns true if this is an empty [Task].
  bool get isEmpty => id.isEmpty && title.isEmpty && notes.isEmpty;

  /// Returns true if this is a non-empty [Task].
  bool get isNotEmpty => !isEmpty;
}

@freezed
abstract class ScheduledTransaction with _$ScheduledTransaction {
  const factory ScheduledTransaction({
    @Default(TransactionId.empty) final TransactionId transactionId,

    /// it may have no task id if it is a one time transaction
    @Default(TaskId.empty) final TaskId taskId,
    @Default(TransactionSchedule.empty) final TransactionSchedule schedule,
  }) = _ScheduledTransaction;
  const ScheduledTransaction._();
  factory ScheduledTransaction.fromJson(final Map<String, dynamic> json) =>
      _$ScheduledTransactionFromJson(json);
  static const empty = ScheduledTransaction();
  bool get isNotSet => transactionId == TransactionId.empty;

  /// means that this transaction is planned
  bool get isSet => !isNotSet;
}

/// Represents a monetary value in a specific fiat or crypto currency
@freezed
abstract class TransactionSchedule with _$TransactionSchedule {
  const factory TransactionSchedule({
    @Default(TransactionPeriodType.none) final TransactionPeriodType periodType,
    @Default(Period.daily) final Period period,
    final DateTime? startedAt,
    final DateTime? endedAt,
  }) = _TransactionSchedule;

  const TransactionSchedule._();
  factory TransactionSchedule.fromJson(final Map<String, dynamic> json) =>
      _$TransactionScheduleFromJson(json);

  static const empty = TransactionSchedule();
  bool get isSet => periodType == TransactionPeriodType.none;
  bool get isNotSet => !isSet;
}

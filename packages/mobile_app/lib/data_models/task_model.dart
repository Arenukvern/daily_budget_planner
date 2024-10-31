part of 'data_models.dart';

enum TaskStatus {
  active,
  archived;

  factory TaskStatus.fromJson(final String json) =>
      TaskStatus.values.byName(json);
  String toJson() => name;

  bool get isActive => this == TaskStatus.active;
  bool get isArchived => this == TaskStatus.archived;
}

extension type const TaskId(String value) {
  factory TaskId.fromJson(final String value) => TaskId(value);
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
}

enum TaskType {
  income,
  investments,
  crypto,
  cashback;
}

@freezed
class Task with _$Task {
  const factory Task({
    @Default(TaskId.empty) final TaskId id,
    @Default(TaskStatus.active) final TaskStatus status,
    @Default('') final String title,
    @Default('') final String notes,
    @Default(TaskType.income) final TaskType type,
    @Default(TaskTransactionType.expense)
    final TaskTransactionType transactionType,
    @Default([]) final List<CategoryId> categoryIds,
  }) = _Task;
  factory Task.fromJson(final Map<String, dynamic> json) =>
      _$TaskFromJson(json);
  static const empty = Task();
}

/// Represents a monetary value in a specific fiat or crypto currency
@freezed
class TransactionSchedule with _$TransactionSchedule {
  const factory TransactionSchedule({
    @Default(TransactionPeriodType.none) final TransactionPeriodType periodType,
    @Default(Period.daily) final Period period,
    @Default(0) final int dayOfMonth,
    @Default(0) final int dayOfWeek,
    @Default(0) final int dayOfQuarter,
    final DateTime? date,
  }) = _TransactionSchedule;

  const TransactionSchedule._();
  factory TransactionSchedule.fromJson(final Map<String, dynamic> json) =>
      _$TransactionScheduleFromJson(json);

  static const empty = TransactionSchedule();
  bool get isSet => periodType == TransactionPeriodType.none;
  bool get isNotSet => !isSet;
}

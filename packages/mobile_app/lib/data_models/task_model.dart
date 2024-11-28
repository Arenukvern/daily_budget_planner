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
  factory TaskId.create() => TaskId(createId());
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
  other,
  investments,
  crypto,
}

enum TaskType {
  personal,
  business;
}

@freezed
class Task with _$Task {
  const factory Task({
    @Default(TaskId.empty) final TaskId id,
    @Default(TaskStatus.visible) final TaskStatus status,
    @Default('') final String title,
    @Default('') final String notes,
    @Default(TaskType.personal) final TaskType type,
    @Default(PersonalIncomeTaskType.salary)
    final PersonalIncomeTaskType personalIncomeType,
    @Default(PersonalExpenseTaskType.other)
    final PersonalExpenseTaskType personalExpenseType,
    @Default(TaskTransactionType.income)
    final TaskTransactionType transactionType,
    @Default([]) final List<CategoryId> categoryIds,
    @Default([]) final List<ScheduledTransaction> schedules,
  }) = _Task;
  const Task._();
  factory Task.fromJson(final Map<String, dynamic> json) =>
      _$TaskFromJson(json);
  static const empty = Task();
  List<TransactionId> get transactionIds =>
      schedules.map((final e) => e.transactionId).toList();
}

@freezed
class ScheduledTransaction with _$ScheduledTransaction {
  const factory ScheduledTransaction({
    @Default(TransactionId.empty) final TransactionId transactionId,
    @Default(TransactionSchedule.empty) final TransactionSchedule schedule,
  }) = _ScheduledTransaction;
  const ScheduledTransaction._();
  factory ScheduledTransaction.fromJson(final Map<String, dynamic> json) =>
      _$ScheduledTransactionFromJson(json);
  static const empty = ScheduledTransaction();
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

part of 'data_models.dart';

enum FinTaskModelPurpose { dailyBudget }

@freezed
abstract class FinTaskModel with _$FinTaskModel {
  factory FinTaskModel({
    @Default(TaskId.empty) final TaskId id,
    @Default('') final String name,
    @Default(FinTaskModelPurpose.dailyBudget) final FinTaskModelPurpose purpose,
    @Default(TaskType.personal) final TaskType type,
    @Default(TaskStatus.visible) final TaskStatus status,
    @Default(Period.monthly) final Period period,
    final DateTime? startDate,
    @Default(TaskId.empty) final TaskId regularIncomeTaskId,
  }) = _FinTaskModel;
  FinTaskModel._({final DateTime? startDate})
    : startDate = startDate ?? DateTime.now();
  factory FinTaskModel.fromJson(final Map<String, dynamic> json) =>
      _$FinTaskModelFromJson(json);
  @override
  final DateTime startDate;
}

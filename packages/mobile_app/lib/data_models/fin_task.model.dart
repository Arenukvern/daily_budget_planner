part of 'data_models.dart';

@freezed
class FinTask with _$FinTask {
  const factory FinTask({
    @Default(TaskId.empty) final TaskId id,
    @Default('') final String name,
    @Default(TaskType.personal) final TaskType type,
    @Default(TaskStatus.visible) final TaskStatus status,
  }) = _FinTask;

  const FinTask._();
  factory FinTask.fromJson(final Map<String, dynamic> json) =>
      _$FinTaskFromJson(json);
}

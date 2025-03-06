import 'package:mobile_app/common_imports.dart';

class TaskIdField extends StatelessWidget {
  const TaskIdField({
    required this.taskId,
    required this.onChanged,
    required this.transactionType,
    this.readonly = false,
    super.key,
  });
  final TaskId taskId;
  final ValueChanged<TaskId> onChanged;
  final bool readonly;
  final TaskTransactionType transactionType;

  @override
  Widget build(final BuildContext context) {
    // TODO(arenukvern): add localization l10n
    const labelText = 'category';
    final task = context.select<TasksResource, Task>(
      (final s) => s.getTaskById(taskId, transactionType: transactionType),
    );
    if (readonly) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('#${task.title}', style: context.textTheme.titleMedium),
          const Gap(4),
          Text(labelText, style: context.textTheme.labelMedium),
        ],
      );
    }
    // TODO(arenukvern): add separate widget - hook blocked by if condition
    final tasks = context.select<TasksResource, List<Task>>(
      (final s) => s.getTasks(transactionType),
    );
    return InputFieldDecorator(
      labelText: labelText,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 4),
        child: Wrap(
          runSpacing: 4,
          spacing: 4,
          alignment: WrapAlignment.center,
          children: [
            for (final task in tasks)
              InputChip(
                label: Text(task.title),
                showCheckmark: false,
                selected: taskId == task.id,
                onPressed: () => onChanged(task.id),
              ),
          ],
        ),
      ),
    );
  }
}

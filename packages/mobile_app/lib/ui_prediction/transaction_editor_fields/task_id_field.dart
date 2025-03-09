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
    final task =
        switch (transactionType) {
          TaskTransactionType.income => context
              .select<IncomeTasksResource, Task?>((final s) => s[taskId]),
          TaskTransactionType.expense => context
              .select<ExpenseTasksResource, Task?>((final s) => s[taskId]),
        } ??
        Task.empty;
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
    final tasks = switch (transactionType) {
      TaskTransactionType.income => context
          .select<IncomeTasksResource, List<Task>>(
            (final s) => s.orderedValues,
          ),
      TaskTransactionType.expense => context
          .select<ExpenseTasksResource, List<Task>>(
            (final s) => s.orderedValues,
          ),
    };
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

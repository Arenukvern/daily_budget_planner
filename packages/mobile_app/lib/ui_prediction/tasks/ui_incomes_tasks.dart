import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_view.dart';

class UiIncomesTasks extends StatelessWidget {
  const UiIncomesTasks({super.key});

  @override
  Widget build(final BuildContext context) {
    final tasks = context.select<TasksNotifier, List<Task>>(
      (final c) => c.getTasks(TaskTransactionType.income),
    );
    return UiTasksView(
      tasks: tasks,
    );
  }
}

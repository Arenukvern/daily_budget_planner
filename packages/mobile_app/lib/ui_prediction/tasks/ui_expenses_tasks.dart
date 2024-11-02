import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_view.dart';

class UiExpensesTasksView extends StatelessWidget {
  const UiExpensesTasksView({super.key});
  static Future<void> show({
    required final BuildContext context,
  }) async =>
      Navigator.of(context).push(
        CupertinoModalSheetRoute(
          builder: (final _) => UiBottomSheetWrapper(
            child: UiIncomesTasksView(),
          ),
        ),
      );

  @override
  Widget build(final BuildContext context) => UiColumnScaffold(
        appBar: UiAppBar(
          titleText: 'Regular expenses',
          automaticallyImplyLeading: false,
          trailing: UiTextActionButton.done(),
        ),
        children: [
          Expanded(
            child: UiExpensesTasks(),
          ),
          UiTasksActionsBar(
            tuple: (type: TransactionType.expense,),
          ),
          Gap(8),
          UiSafeArea.bottom(),
        ],
      );
}

class UiExpensesTasks extends StatelessWidget {
  const UiExpensesTasks({super.key});

  @override
  Widget build(final BuildContext context) {
    final tasks = context.select<TasksNotifier, List<Task>>(
      (final c) => c.getTasks(TaskTransactionType.expense),
    );
    return UiTasksView(tasks: tasks);
  }
}

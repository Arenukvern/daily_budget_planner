import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_view.dart';

class UiIncomesTasksView extends StatelessWidget {
  const UiIncomesTasksView({super.key});
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
          titleText: 'Regular incomes',
          automaticallyImplyLeading: false,
          trailing: UiTextActionButton.done(),
        ),
        children: [
          Expanded(
            child: UiIncomesTasks(),
          ),
          UiTasksActionsBar(
            tuple: (type: TransactionType.income,),
          ),
          Gap(8),
          UiSafeArea.bottom(),
        ],
      );
}

class UiIncomesTasks extends StatelessWidget {
  const UiIncomesTasks({super.key});
  static Future<void> show(final BuildContext context) async =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (final _) => const UiIncomesTasks(),
        ),
      );

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

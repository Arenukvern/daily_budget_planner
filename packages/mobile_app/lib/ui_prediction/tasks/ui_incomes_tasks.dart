import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';

class UiIncomesTasksView extends HookWidget {
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
  Widget build(final BuildContext context) {
    final tasks = context.select<TasksNotifier, List<Task>>(
      (final c) => c.getTasks(TaskTransactionType.income),
    );
    final taskState = useUiTaskState(tasks.first);
    return UiColumnScaffold(
      appBar: UiAppBar(
        titleText: 'Regular incomes',
        automaticallyImplyLeading: false,
        trailing: UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: Row(
            children: [
              UiTasksBarView(
                tasks: tasks,
                onSelect: (final value) => taskState.value = value,
              ),
              UiTaskVerticalActionsBar(
                task: taskState.value.task,
              ),
              Expanded(
                child: UiTaskView(
                  task: taskState.value.task,
                  currencyType: Envs.kDefaultCurrencyType,
                ),
              ),
            ],
          ),
        ),
        UiTasksActionsBar(
          tuple: (
            taskTransactionType: TaskTransactionType.income,
            currencyType: CurrencyType.fiat
          ),
        ),
        Gap(8),
        UiSafeArea.bottom(),
      ],
    );
  }
}

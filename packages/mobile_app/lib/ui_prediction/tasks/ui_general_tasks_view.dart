import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';

typedef UiTaskState = ({Task task, int index});

ValueNotifier<UiTaskState> useUiTaskState(final Task initialTask) =>
    useState((task: initialTask, index: 0));

Future<void> showExpensesTasksView({
  required final BuildContext context,
}) async =>
    Navigator.of(context).push(
      CupertinoModalSheetRoute(
        builder: (final _) => UiBottomSheetWrapper(
          child: UiGeneralTasksView(
            title: LocalizedMap(
              // TODO(arenukvern): add localization l10n
              value: {
                languages.en: 'Regular expenses',
                languages.it: 'Spese regolari',
                languages.ru: 'Регулярные расходы',
              },
            ),
            taskTransactionType: TaskTransactionType.expense,
          ),
        ),
      ),
    );

Future<void> showIncomesTasksView({
  required final BuildContext context,
}) async =>
    Navigator.of(context).push(
      CupertinoModalSheetRoute(
        builder: (final _) => UiBottomSheetWrapper(
          child: UiGeneralTasksView(
            title: LocalizedMap(
              // TODO(arenukvern): add localization l10n
              value: {
                languages.en: 'Regular incomes',
                languages.it: 'Entrate regolari',
                languages.ru: 'Регулярные доходы',
              },
            ),
            taskTransactionType: TaskTransactionType.income,
          ),
        ),
      ),
    );

class UiGeneralTasksView extends HookWidget {
  const UiGeneralTasksView({
    required this.title,
    required this.taskTransactionType,
    this.currencyType = Envs.kDefaultCurrencyType,
    super.key,
  });
  final LocalizedMap title;
  final TaskTransactionType taskTransactionType;
  final CurrencyType currencyType;
  @override
  Widget build(final BuildContext context) {
    final tasks = context.select<TasksNotifier, List<Task>>(
      (final c) => c.getTasks(taskTransactionType),
    );
    final taskState = useUiTaskState(tasks.first);
    final task = taskState.value.task;
    final locale = useLocale(context);
    return UiColumnScaffold(
      appBar: UiAppBar(
        titleText: title.getValue(locale),
        automaticallyImplyLeading: false,
        trailing: UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: Row(
            children: [
              Center(
                child: UiTasksBarView(
                  taskTransactionType: taskTransactionType,
                  tasks: tasks,
                  onSelect: (final value) => taskState.value = value,
                ),
              ),
              UiTaskVerticalActionsBar(
                task: task,
                isUsedForTaskPlanning: true,
                currencyType: currencyType,
              ),
              Expanded(
                child: UiTaskView(
                  task: task,
                  currencyType: currencyType,
                ),
              ),
            ],
          ),
        ),
        UiTasksActionsBar(
          tuple: (
            task: task,
            taskTransactionType: taskTransactionType,
            currencyType: currencyType,
          ),
        ),
        Gap(8),
        UiSafeArea.bottom(),
      ],
    );
  }
}

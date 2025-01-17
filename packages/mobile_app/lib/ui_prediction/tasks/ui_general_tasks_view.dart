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
            taskTransactionType: TaskTransactionType.income,
          ),
        ),
      ),
    );

class UiGeneralTasksView extends StatefulWidget {
  const UiGeneralTasksView({
    required this.taskTransactionType,
    this.currencyType = Envs.kDefaultCurrencyType,
    super.key,
  });
  final TaskTransactionType taskTransactionType;
  final CurrencyType currencyType;

  @override
  State<UiGeneralTasksView> createState() => _UiGeneralTasksViewState();
}

class _UiGeneralTasksViewState extends State<UiGeneralTasksView>
    with HasStates {
  UiTaskState? _taskState;
  List<Task> _tasks = [];
  TaskTransactionType _taskTransactionType = TaskTransactionType.income;
  late final CurrencyType _currencyType = widget.currencyType;
  @override
  void initState() {
    super.initState();
    _loadTransactionType(
      taskTransactionType: widget.taskTransactionType,
    );
  }

  void _loadTransactionType({
    required final TaskTransactionType taskTransactionType,
    final bool notify = false,
  }) {
    _taskTransactionType = taskTransactionType;
    _tasks = tasksNotifier.getTasks(_taskTransactionType);
    _taskState = (task: _tasks.first, index: 0);
    if (notify) setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    final task = _taskState?.task ?? _tasks.first;
    final locale = useLocale(context);

    return UiColumnScaffold(
      appBar: UiAppBar(
        title: CupertinoSlidingSegmentedControl(
          children: {
            TaskTransactionType.expense: Text(
              LocalizedMap(
                // TODO(arenukvern): add localization l10n
                value: {
                  languages.en: 'Regular expenses',
                  languages.it: 'Spese regolari',
                  languages.ru: 'Регулярные расходы',
                },
              ).getValue(locale),
            ),
            TaskTransactionType.income: Text(
              LocalizedMap(
                // TODO(arenukvern): add localization l10n
                value: {
                  languages.en: 'Regular incomes',
                  languages.it: 'Entrate regolari',
                  languages.ru: 'Регулярные доходы',
                },
              ).getValue(locale),
            ),
          },
          groupValue: _taskTransactionType,
          onValueChanged: (final value) {
            if (value == null) return;
            _loadTransactionType(
              taskTransactionType: value,
              notify: true,
            );
          },
        ),
        automaticallyImplyLeading: false,
        trailing: UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: Row(
            children: [
              Center(
                child: UiTasksBarView(
                  taskTransactionType: _taskTransactionType,
                  tasks: _tasks,
                  onSelect: (final value) => setState(() => _taskState = value),
                ),
              ),
              UiTaskVerticalActionsBar(
                task: task,
                isUsedForTaskPlanning: true,
                currencyType: _currencyType,
              ),
              Expanded(
                child: UiTaskView(
                  task: task,
                  currencyType: _currencyType,
                ),
              ),
            ],
          ),
        ),
        UiTasksActionsBar(
          tuple: (
            task: task,
            taskTransactionType: _taskTransactionType,
            currencyType: _currencyType,
          ),
        ),
        Gap(8),
        UiSafeArea.bottom(),
      ],
    );
  }
}

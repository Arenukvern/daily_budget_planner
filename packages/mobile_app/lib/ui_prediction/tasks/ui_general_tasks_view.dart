import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';

Future<void> showExpensesTasksView({
  required final BuildContext context,
}) async => Navigator.of(context).push(
  CupertinoModalSheetRoute(
    builder:
        (final _) => const UiBottomSheetWrapper(
          child: UiGeneralTasksView(
            taskTransactionType: TaskTransactionType.expense,
          ),
        ),
  ),
);

Future<void> showIncomesTasksView({
  required final BuildContext context,
}) async => Navigator.of(context).push(
  CupertinoModalSheetRoute(
    builder:
        (final _) => const UiBottomSheetWrapper(
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
    with HasNotifiers, HasResources {
  var _taskIndex = 0;
  late TaskTransactionType _taskTransactionType = widget.taskTransactionType;
  late final CurrencyType _currencyType = widget.currencyType;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      _loadTransactionType(taskTransactionType: _taskTransactionType);
    });
  }

  List<Task> get _tasks => tasksResource.getTasks(_taskTransactionType);

  void _loadTransactionType({
    required final TaskTransactionType taskTransactionType,
    final bool notify = false,
  }) {
    _taskTransactionType = taskTransactionType;
    _taskIndex = 0;

    if (notify) setState(() {});
    if (_tasks.isEmpty) return;

    final task = _tasks[_taskIndex];

    unawaited(
      const LoadTaskTransactionsCommand().execute(
        taskId: task.id,
        startDate: predictionConfigResource.startDate,
        period: predictionConfigResource.period,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final tasks = context.select<TasksResource, List<Task>>(
      (final c) => c.getTasks(_taskTransactionType),
    );
    final task = tasks[_taskIndex];
    final (:startDate, :period) = context.select<
      PredictionConfigResource,
      ({DateTime startDate, Period period})
    >((final c) => (startDate: c.startDate, period: c.period));

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
            _loadTransactionType(taskTransactionType: value, notify: true);
          },
        ),
        automaticallyImplyLeading: false,
        trailing: const UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: Row(
            children: [
              Center(
                child: UiTasksBarView(
                  taskTransactionType: _taskTransactionType,
                  tasks: tasks,
                  onSelect: (final value) async {
                    setState(() => _taskIndex = value);
                    unawaited(
                      const LoadTaskTransactionsCommand().execute(
                        taskId: task.id,
                        startDate: startDate,
                        period: period,
                      ),
                    );
                  },
                ),
              ),
              UiTaskVerticalActionsBar(
                task: task,
                isUsedForTaskPlanning: true,
                currencyType: _currencyType,
              ),
              Expanded(
                child: UiTaskView(task: task, currencyType: _currencyType),
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
        const Gap(8),
        const UiSafeArea.bottom(),
      ],
    );
  }
}

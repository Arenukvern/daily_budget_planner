import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';

const _kItemExtent = 48.0;

class UiTasksBarView extends StatefulWidget {
  const UiTasksBarView({
    required this.tasks,
    required this.onSelect,
    super.key,
  });
  final List<Task> tasks;
  final ValueChanged<UiTaskState> onSelect;

  @override
  State<UiTasksBarView> createState() => _UiTasksBarViewState();
}

class _UiTasksBarViewState extends State<UiTasksBarView> {
  final _scrollController = FixedExtentScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final tasks = widget.tasks;
    return Container(
      height: 216.clamp(height * 0.7, height * 0.8).toDouble(),
      constraints: const BoxConstraints(maxWidth: 220),
      child: CupertinoPicker(
        itemExtent: _kItemExtent,
        magnification: 1.22,
        squeeze: 1.2,
        useMagnifier: true,
        scrollController: _scrollController,
        onSelectedItemChanged: (final index) =>
            widget.onSelect((task: tasks[index], index: index)),
        children: [
          ...tasks.mapIndexed(
            (final index, final task) => UiBaseButton(
              pressedScale: 1,
              onPressed: () async => _scrollController.animateToItem(
                index,
                duration: 200.milliseconds,
                curve: Curves.easeInOut,
              ),
              builder: (final context, final focused, final onlyFocused) =>
                  Center(
                child: Text(
                  task.title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UiTaskVerticalActionsBar extends StatelessWidget {
  const UiTaskVerticalActionsBar({required this.task, super.key});
  final Task task;

  @override
  Widget build(final BuildContext context) => Center(
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(8),
                AddTaskTransactionButton(
                  padding: const EdgeInsets.all(3),
                  task: task,
                  currencyType: Envs.kDefaultCurrencyType,
                ),
                Gap(8),
              ],
            ),
          ),
        ),
      );
}

class UiTaskView extends StatelessWidget with HasStates {
  const UiTaskView({
    required this.currencyType,
    required this.task,
    super.key,
  });
  final CurrencyType currencyType;
  final Task task;
  @override
  Widget build(final BuildContext context) {
    final transactions = context.select<TasksNotifier, List<Transaction>>(
      (final c) => c.getTransactionsByTask(task),
    );
    void onRemove(final Transaction transaction) =>
        tasksNotifier.removeTransaction(transaction, task);
    return CupertinoListSection(
      backgroundColor: Colors.transparent,
      header: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  task.title,
                  style: context.textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              children: [
                Text('From Today: '),
                // TODO(arenukvern): add localization l10n
                Text(
                  '${transactions.sumForPeriod(Period.yearly).toStringAsFixed(2)} yearly • ',
                ),
                Text(
                  '${transactions.sumForPeriod(Period.monthly).toStringAsFixed(2)} monthly',
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
      ),
      children: [
        ...transactions.map(
          (final transaction) => _UiTransactionCard(
            transaction: transaction,
            onRemove: onRemove,
            key: ValueKey(transaction.id),
          ),
        ),
      ],
    );
  }
}

class _UiTransactionCard extends StatelessWidget {
  const _UiTransactionCard({
    required this.transaction,
    required this.onRemove,
    super.key,
  });
  final Transaction transaction;
  final ValueChanged<Transaction> onRemove;

  @override
  Widget build(final BuildContext context) => CupertinoListTile(
        leading: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '${transaction.input.amount(taxFree: kAmountsTaxFree).toStringAsFixed(2)} '
            // TODO(arenukvern): show only currency different from default
            '${transaction.input.currencyId.toJson()}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(transaction.description),
        leadingSize: 48,
        additionalInfo: Text(
          DateFormat('yyyy-MM-dd').format(transaction.transactionDate),
          style: context.textTheme.bodySmall,
        ),
        trailing: UiBaseButton(
          onPressed: () => onRemove(transaction),
          builder: (final context, final focused, final onlyFocused) => Icon(
            Icons.remove,
            color:
                focused ? null : context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      );
}

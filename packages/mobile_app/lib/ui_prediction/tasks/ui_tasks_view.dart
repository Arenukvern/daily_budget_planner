import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';

class UiTasksView extends StatelessWidget {
  const UiTasksView({
    required this.tasks,
    super.key,
  });
  final List<Task> tasks;

  @override
  Widget build(final BuildContext context) {
    final currencyType = CurrencyType.fiat;
    return ListView(
      children: [
        ...tasks.map(
          (final task) => _UiTaskCard(
            currencyType: currencyType,
            task: task,
          ),
        ),
        const Gap(16),
        UiSafeArea.bottom(),
      ],
    );
  }
}

class _UiTaskCard extends StatelessWidget with HasStates {
  const _UiTaskCard({
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
    final defaultCurrencyId = context.select<FinSettingsNotifier, CurrencyId>(
      (final c) => c.getDefaultCurrencyId(currencyType),
    );
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
                Text('From Today - '),
                // TODO(arenukvern): add localization l10n
                Text(
                  'yearly: ${transactions.sumForPeriod(Period.yearly).toStringAsFixed(2)} • ',
                ),
                Text(
                  'monthly: ${transactions.sumForPeriod(Period.monthly).toStringAsFixed(2)}',
                ),
              ],
            ),
          ),
          Gap(4),
          Row(
            children: [
              UiBaseButton(
                onPressed: () async {
                  final transaction = await showTransactionEditor(
                    context,
                    transaction: Transaction.create(
                      type: task.transactionType.toTransactionType(),
                      currencyType: currencyType,
                      currencyId: defaultCurrencyId,
                    ),
                    dto: TransactionEditorDto(
                      isTypeChangable: false,
                    ),
                  );
                  if (transaction == null) return;
                  // TODO(arenukvern): ask for period
                  final schedule = TransactionSchedule(
                    period: Period.monthly,
                    dayOfMonth: 1,
                  );
                  await tasksNotifier.upsertTransaction(
                    transaction: transaction,
                    schedule: schedule,
                    task: task,
                  );
                  // TODO(arenukvern): upsert transaction
                },
                builder: (final context, final focused, final onlyFocused) =>
                    Icon(
                  Icons.add,
                  color: focused
                      ? null
                      : context.colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
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

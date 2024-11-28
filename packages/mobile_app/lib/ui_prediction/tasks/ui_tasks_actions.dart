import 'package:mobile_app/common_imports.dart';

class AddTaskTransactionButton extends StatelessWidget {
  const AddTaskTransactionButton({
    required this.task,
    required this.currencyType,
    this.padding = const EdgeInsets.all(8),
    super.key,
  });
  final Task task;
  final CurrencyType currencyType;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(final BuildContext context) {
    final tasksNotifier = context.read<TasksNotifier>();
    final defaultCurrencyId = useDefaultCurrencyId(
      context,
      currencyType: currencyType,
    );
    final locale = useLocale(context);
    return UiBaseButton(
      tooltip: LocalizedMap(
        value: {
          languages.en: 'Add transaction',
          languages.ru: 'Добавить транзакцию',
        },
      ).getValue(locale),
      onPressed: () async {
        final transaction = await showTransactionEditor(
          context,
          transaction: Transaction.create(
            type: task.transactionType.toTransactionType(),
            currencyType: currencyType,
            currencyId: defaultCurrencyId,
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
          UiFocusedBox(
        focused: focused,
        child: Padding(
          padding: padding,
          child: Icon(
            Icons.add,
            color:
                focused ? null : context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

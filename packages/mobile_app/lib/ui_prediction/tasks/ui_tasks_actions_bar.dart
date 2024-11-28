import 'package:mobile_app/common_imports.dart';

typedef UiTasksActionsBarTuple = ({
  TaskTransactionType taskTransactionType,
  CurrencyType currencyType,
});

class UiTasksActionsBar extends StatelessWidget {
  const UiTasksActionsBar({required this.tuple, super.key});
  final UiTasksActionsBarTuple tuple;
  @override
  Widget build(final BuildContext context) {
    final defaultCurrencyId = context.select<FinSettingsNotifier, CurrencyId>(
      (final state) => state.getDefaultCurrencyId(tuple.currencyType),
    );
    final locale = useLocale(context);
    return UiBottomActionBar(
      children: [
        const UiBackButton(),
        UiTextButton(
          onPressed: () async {
            final notifier = context.read<UiPredictionNotifier>();
            final transaction = await showTransactionEditor(
              context,
              transaction: Transaction.create(
                type: tuple.taskTransactionType.toTransactionType(),
                currencyType: tuple.currencyType,
                currencyId: defaultCurrencyId,
              ),
              dto: TransactionEditorDto(
                isTypeChangable: false,
              ),
            );
            if (transaction == null) return;
            return notifier.upsertTransaction(transaction);
          },
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Gap(4),
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Add ${tuple.taskTransactionType.name}',
                    languages.it:
                        'Aggiungi ${switch (tuple.taskTransactionType) {
                      TaskTransactionType.income => 'entrate',
                      TaskTransactionType.expense => 'spese',
                    }}',
                    languages.ru:
                        'Добавить ${switch (tuple.taskTransactionType) {
                      TaskTransactionType.income => 'доход',
                      TaskTransactionType.expense => 'расход',
                    }}',
                  },
                ).getValue(locale),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

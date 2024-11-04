import 'package:mobile_app/common_imports.dart';

typedef UiTasksActionsBarTuple = ({
  TaskTransactionType type,
});

class UiTasksActionsBar extends StatelessWidget {
  const UiTasksActionsBar({required this.tuple, super.key});
  final UiTasksActionsBarTuple tuple;
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiBottomActionBar(
      children: [
        const UiBackButton(),
        UiTextButton(
          onPressed: () async {
            final notifier = context.read<UiPredictionNotifier>();
            final transaction = await showTransactionEditor(
              context,
              transaction: null,
              transactionType: tuple.type == TaskTransactionType.income
                  ? TransactionType.income
                  : TransactionType.expense,
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
                    languages.en: 'Add ${tuple.type.name}',
                    languages.it: 'Aggiungi ${switch (tuple.type) {
                      TaskTransactionType.income => 'entrate',
                      TaskTransactionType.expense => 'spese',
                    }}',
                    languages.ru: 'Добавить ${switch (tuple.type) {
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

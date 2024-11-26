import 'package:mobile_app/common_imports.dart';

typedef UiTransactionsActionsBarTuple = ({
  TransactionType type,
});

class UiTransactionsActionsBar extends StatelessWidget {
  const UiTransactionsActionsBar({required this.tuple, super.key});
  final UiTransactionsActionsBarTuple tuple;
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final defaultCurrencyId = context
        .read<FinSettingsNotifier>()
        .getDefaultCurrencyId(Envs.kDefaultCurrencyType);
    return UiBottomActionBar(
      children: [
        const UiBackButton(),
        UiTextButton(
          onPressed: () async {
            final notifier = context.read<UiPredictionNotifier>();
            final transaction = await showTransactionEditor(
              context,
              transaction: Transaction.create(
                type: tuple.type,
                currencyType: Envs.kDefaultCurrencyType,
                currencyId: defaultCurrencyId,
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
                    languages.en: 'Add ${tuple.type.name}',
                    languages.it: 'Aggiungi ${switch (tuple.type) {
                      TransactionType.income => 'entrate',
                      TransactionType.expense => 'spese',
                      TransactionType.transferIn => 'transferenze in',
                      TransactionType.transferOut => 'transferenze out',
                    }}',
                    languages.ru: 'Добавить ${switch (tuple.type) {
                      TransactionType.income => 'доход',
                      TransactionType.expense => 'расход',
                      TransactionType.transferIn => 'входящий перевод',
                      TransactionType.transferOut => 'исходящий перевод',
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

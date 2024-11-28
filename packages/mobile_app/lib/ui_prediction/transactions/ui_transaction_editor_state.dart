part of 'ui_transaction_editor.dart';

class _EditingController extends ValueNotifier<LoadableContainer<Transaction>> {
  _EditingController({
    required final Transaction transaction,
  })  : isEditing = transaction.isExists,
        _canCompose = transaction.isExists,
        super(
          LoadableContainer(
            value: transaction,
            isLoaded: transaction.isExists,
          ),
        ) {
    onLoad();
  }
  bool get isNew => !isEditing;
  final bool isEditing;

  late final _composedListenable = Listenable.merge([
    amount,
    coinPrice,
  ]);
  void onLoad() {
    _composedListenable.addListener(notifyListeners);

    final rawAmount = transaction.input.amount(taxFree: kAmountsTaxFree);
    if (rawAmount > 0) amount.text = rawAmount.toString();
    // TODO(arenukvern): description
    // coinPrice.text = transaction?.input.coinPrice.toString() ?? '';
  }

  LoadableContainer<Transaction> get container => value;
  Transaction get transaction => container.value;
  bool get isLoaded => container.isLoaded;
  final amount = TextEditingController();
  final coinPrice = TextEditingController();

  @override
  void notifyListeners() {
    _verifyCompose();
    super.notifyListeners();
  }

  void _verifyCompose() {
    bool readyToCompose = false;
    switch (transaction.input.currencyType) {
      case CurrencyType.fiat:
        readyToCompose = doubleFromJson(amount.text) > 0;
      case CurrencyType.crypto:
        readyToCompose = doubleFromJson(amount.text) > 0 &&
            doubleFromJson(coinPrice.text) > 0;
    }
    _canCompose = readyToCompose;
  }

  void setState(final Transaction Function(Transaction state) change) =>
      value = LoadableContainer(
        value: change(transaction),
        isLoaded: true,
      );

  void setMoney(final InputMoney Function(InputMoney state) change) =>
      setState((final state) => state.copyWith(input: change(state.input)));

  bool _canCompose = false;
  bool get canCompose => _canCompose;

  Transaction? compose() {
    if (!canCompose) return null;
    final amount = doubleFromJson(this.amount.text);
    // final coinPrice = doubleFromJson(this.coinPrice.text);

    return transaction.copyWith(
      id: isNew ? TransactionId.newId() : transaction.id,
      input: switch (transaction.input.currencyType) {
        CurrencyType.fiat => InputMoney.fiat(amountWithTax: amount),
        CurrencyType.crypto => InputMoney.crypto(
            amountWithTax: amount,
            // coinPrice: coinPrice,
          ),
      },
    );
  }

  @override
  void dispose() {
    _composedListenable.removeListener(notifyListeners);
    amount.dispose();
    coinPrice.dispose();
    super.dispose();
  }
}

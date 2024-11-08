part of 'transaction_editor.dart';

class _EditingController extends ValueNotifier<LoadableContainer<Transaction>> {
  _EditingController({
    required final Transaction? transaction,
    required final TransactionType transactionType,
  })  : isEditing = transaction != null,
        _canCompose = transaction != null,
        super(
          LoadableContainer(
            value: transaction ??
                Transaction.empty.copyWith(type: transactionType),
            isLoaded: transaction != null,
          ),
        ) {
    onLoad();
  }
  bool get isNew => !isEditing;
  final bool isEditing;
  void onLoad() {
    Listenable.merge([
      amount,
      coinPrice,
    ]).addListener(notifyListeners);
    amount.text = transaction.input.amount(taxFree: kAmountsTaxFree).toString();
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
    super.dispose();
    amount.dispose();
    coinPrice.dispose();
  }
}

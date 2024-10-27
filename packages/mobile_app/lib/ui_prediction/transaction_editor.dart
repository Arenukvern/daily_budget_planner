import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_kit/atoms/ui_date_time_field.dart';
import 'package:mobile_app/ui_prediction/ui_incomes_view.dart';

Future<Transaction?> showTransactionEditor(
  final BuildContext context, {
  required final Transaction? transaction,
}) =>
    Navigator.push(
      context,
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (final context) => _TransactionEditor(
          transaction: transaction,
        ),
      ),
    );

class _TransactionEditor extends StatefulHookWidget {
  const _TransactionEditor({required this.transaction});

  final Transaction? transaction;

  @override
  State<_TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<_TransactionEditor> {
  late final _EditingController controller = _EditingController(
    transaction: widget.transaction,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> onPopInvoked() async {
    if (!controller.canCompose) {
      // Dismiss immediately if there are no unsaved changes.
      Navigator.pop(context);
      return;
    }

    // Show a confirmation dialog.
    final shouldPop = await showDialog(
      context: context,
      builder: (final context) => AlertDialog(
        title: const Text('Discard changes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Discard'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (shouldPop == true && mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(final BuildContext context) {
    useListenable(controller);
    final locale = useLocale(context);
    final transaction = controller.transaction;
    final isNew = controller.isNew;
    final currencyType = transaction.input.currencyType;
    // TODO(arenukvern): add localization l10n
    final transactionTypeNames = {
      ...switch (currencyType) {
        CurrencyType.fiat => {
            TransactionType.income: 'Income',
            TransactionType.expense: 'Expense',
          },
        CurrencyType.crypto => {
            TransactionType.income: 'Buy',
            TransactionType.expense: 'Sell',
          },
      },
      TransactionType.transferIn: 'Transfer in',
      TransactionType.transferOut: 'Transfer out',
    };
    final amountField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Builder(
        builder: (final context) {
          final label = switch (currencyType) {
            CurrencyType.fiat => LocalizedMap(
                value: {
                  languages.en: 'Amount',
                  languages.it: 'Importo',
                  languages.ru: 'Сумма',
                },
              ),
            CurrencyType.crypto => LocalizedMap(
                value: {
                  languages.en: 'Quantity',
                  languages.it: 'Quantità',
                  languages.ru: 'Количество',
                },
              ),
          };
          return UiTextField(
            decoration: InputDecoration(
              hintText: '0.00',
              labelText: label.getValue(locale),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.min(0),
            ]),
            inputFormatters: [
              NumberFieldUtils.doubleInputFormatter,
            ],
            autofocus: true,
            style: Theme.of(context).textTheme.titleLarge,
            controller: controller.amount,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          );
        },
      ),
    );

    final nameField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: UiTextField(
        decoration: InputDecoration(
          labelText: 'Name (Optional)',
        ),
        value: transaction.description,
        onChanged: (final value) {
          controller.setState(
            (final state) => state.copyWith(description: value),
          );
        },
      ),
    );
    final noteField = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: UiTextField(
        decoration: InputDecoration(
          labelText: 'Notes (Optional)',
        ),
        value: transaction.note,
        onChanged: (final value) {
          controller.setState(
            (final state) => state.copyWith(description: value),
          );
        },
      ),
    );

    final body = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: UiAppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    '${isNew ? 'Add' : 'Edit'} '
                    '${transactionTypeNames[transaction.type]!}',
                  ),
                  trailing: UiTextActionButton.cancel(),
                ),
              ),
            ],
          ),

          /// Currency type
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CupertinoSlidingSegmentedControl<CurrencyType>(
                groupValue: currencyType,
                children: {
                  CurrencyType.fiat: Text('Fiat'),
                  CurrencyType.crypto: Text('Crypto'),
                },
                onValueChanged: (final value) {
                  if (value == null) return;
                  controller.setMoney(
                    (final state) => state.copyWith(currencyType: value),
                  );
                },
              ),
            ),
          ),
          Gap(16),

          /// Transaction type
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CupertinoSlidingSegmentedControl<TransactionType>(
                groupValue: transaction.type,
                children: {
                  for (final entry in transactionTypeNames.entries)
                    entry.key: Text(entry.value),
                },
                onValueChanged: (final value) {
                  if (value == null) return;
                  controller
                      .setState((final state) => state.copyWith(type: value));
                },
              ),
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CurrencyAutoCompleter(
              controller: controller,
              type: currencyType,
            ),
          ),
          Gap(16),
          if (currencyType case CurrencyType.fiat) nameField,
          Gap(16),

          /// there is two cases:
          /// when it's crypto:
          /// - sum should be calculated in Quantity * Coin price
          ///
          /// when it's fiat:
          /// - sum is just amount
          // TODO(arenukvern): add crypto amount
          ...switch (transaction.input.currencyType) {
            CurrencyType.fiat => [amountField],
            CurrencyType.crypto => [
                amountField,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Builder(
                    builder: (final context) {
                      final label = LocalizedMap(
                        value: {
                          languages.en: 'Coin price',
                          languages.it: 'Prezzo della moneta',
                          languages.ru: 'Цена монеты',
                        },
                      ).getValue(locale);
                      return UiTextField(
                        decoration: InputDecoration(
                          hintText: '0.00',
                          labelText: label,
                          // TODO(arenukvern): add coin symbol
                          prefixIcon: Icon(Icons.attach_money),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.min(0),
                        ]),
                        autofocus: true,
                        controller: controller.coinPrice,
                        style: Theme.of(context).textTheme.titleLarge,
                        textInputAction: TextInputAction.next,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                      );
                    },
                  ),
                ),
              ],
          },
          Gap(16),
          if (currencyType case CurrencyType.crypto) noteField,
          Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: UiDateTimeField(
              initialValue: transaction.transactionDate,
              onChanged: (final value) {
                controller.setState(
                  (final state) => state.copyWith(transactionDate: value),
                );
              },
            ),
          ),
        ],
      ),
    );

    const sheetShape = ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );

    return SafeArea(
      bottom: false,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (final didPop, final result) async {
          if (didPop) return;
          return onPopInvoked();
        },
        child: SheetKeyboardDismissible(
          dismissBehavior: const SheetKeyboardDismissBehavior.onDragDown(
            isContentScrollAware: true,
          ),
          child: ScrollableSheet(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: sheetShape,
              child: SheetContentScaffold(
                resizeBehavior: const ResizeScaffoldBehavior.avoidBottomInset(
                  // Make the bottom bar visible when the keyboard is open.
                  maintainBottomBar: true,
                ),
                body: body,
                bottomBar: StickyBottomBarVisibility(
                  child: UiBottomActionBar(
                    children: [
                      Expanded(
                        child: UiTextButton(
                          expands: true,
                          onPressed: () {
                            final transaction = controller.compose();
                            if (transaction != null) {
                              Navigator.pop(context, transaction);
                            }
                          },
                          title: Text(
                            '${isNew ? 'Add' : 'Edit'} '
                            '${transactionTypeNames[transaction.type]!}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurrencyAutoCompleter extends HookWidget with HasStates {
  const CurrencyAutoCompleter({
    required this.controller,
    required this.type,
    super.key,
  });

  final _EditingController controller;
  final CurrencyType type;
  @override
  Widget build(final BuildContext context) {
    useListenable(dictionariesNotifier);
    final options = switch (type) {
      CurrencyType.fiat => dictionariesNotifier.fiatCurrenciesList,
      CurrencyType.crypto => dictionariesNotifier.cryptoCurrenciesList,
    };

    Iterable<CurrencyId> getCurrencyOptions(final String query) =>
        options.where(
          (final currency) => dictionariesNotifier
              .getCurrency(currency, type)
              .displayString
              .toLowerCase()
              .contains(query.toLowerCase()),
        );
    return _CurrencyAutocompleter(
      displayStringForOption: (final id) =>
          dictionariesNotifier.getCurrency(id, type).displayString,
      initialValue: controller.transaction.input.currencyId,
      options: options,
      isLoading: dictionariesNotifier.isLoading,
      getCurrencyOptions: getCurrencyOptions,
      onSelected: (final selection) {
        controller.setMoney(
          (final state) => state.copyWith(
            currencyId: selection,
            currencyType:
                dictionariesNotifier.getCurrency(selection, type).type,
          ),
        );
      },
    );
  }
}

class _CurrencyAutocompleter extends HookWidget with HasStates {
  const _CurrencyAutocompleter({
    required this.options,
    required this.isLoading,
    required this.onSelected,
    required this.initialValue,
    required this.displayStringForOption,
    required this.getCurrencyOptions,
    super.key,
  });
  final Iterable<CurrencyId> options;
  final Iterable<CurrencyId> Function(String) getCurrencyOptions;
  final ValueSetter<CurrencyId> onSelected;
  final CurrencyId? initialValue;
  final String Function(CurrencyId) displayStringForOption;
  final bool isLoading;

  @override
  Widget build(final BuildContext context) {
    if (isLoading) {
      return const Center(child: UiCircularProgress());
    }
    final initialValue = this.initialValue?.value ?? '';
    return Autocomplete<String>(
      optionsBuilder: (final textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return options as Iterable<String>;
        }
        return getCurrencyOptions(textEditingValue.text) as Iterable<String>;
      },
      displayStringForOption: (final option) =>
          displayStringForOption(CurrencyId(option)),
      initialValue: (initialValue.isNotEmpty)
          ? TextEditingValue(text: initialValue)
          : null,
      onSelected: (final option) => onSelected(CurrencyId(option)),
      fieldViewBuilder: (
        final context,
        final textController,
        final focusNode,
        final onFieldSubmitted,
      ) =>
          TextField(
        controller: textController,
        focusNode: focusNode,
        decoration: const InputDecoration(
          // TODO(arenukvern): add localization l10n
          labelText: 'Currency',
          hintText: 'Type to search...',
        ),
      ),
    );
  }
}

class _Reminder extends StatelessWidget {
  const _Reminder(this.controller);

  final _EditingController controller;

  @override
  Widget build(final BuildContext context) => ActionChip(
        avatar: const Icon(Icons.alarm),
        label: const Text('Reminder'),
        onPressed: () {},
      );
}

class _EditingController extends ValueNotifier<LoadableContainer<Transaction>> {
  _EditingController({
    required final Transaction? transaction,
  })  : isEditing = transaction != null,
        _canCompose = transaction != null,
        super(
          LoadableContainer(
            value: transaction ?? Transaction.empty,
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
    amount.text = transaction.input.amount.toString();
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
        CurrencyType.fiat => InputMoney.fiat(amount: amount),
        CurrencyType.crypto => InputMoney.crypto(
            amount: amount,
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

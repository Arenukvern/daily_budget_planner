import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_models.dart';
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

  Future<void> onPopInvoked(final bool didPop) async {
    if (didPop) {
      // Already popped.
      return;
    } else if (!controller.canCompose) {
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
            inputFormatters: [
              NumberFieldUtils.doubleInputFormatter,
            ],
            autofocus: true,
            style: Theme.of(context).textTheme.titleLarge,
            controller: controller.amount,
            textInputAction: TextInputAction.next,
            keyboardType: NumberFieldUtils.doubleInputType,
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
                  for (final type in TransactionType.values)
                    type: Text(transactionTypeNames[type]!),
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
                        autofocus: true,
                        controller: controller.coinPrice,
                        style: Theme.of(context).textTheme.titleLarge,
                        textInputAction: TextInputAction.next,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        validator:
                            PositiveNumberValidator(checkNullOrEmpty: false)
                                .validate,
                      );
                    },
                  ),
                ),
              ],
          },
          Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: UiTextField(
              decoration: InputDecoration(
                labelText: switch (currencyType) {
                  CurrencyType.fiat => 'Name (Optional)',
                  CurrencyType.crypto => 'Notes (Optional)',
                },
              ),
              value: transaction.description,
              onChanged: (final value) {
                controller.setState(
                  (final state) => state.copyWith(description: value),
                );
              },
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: UiDateTimeField(
              initialValue: transaction.date,
              onChanged: (final value) {
                controller
                    .setState((final state) => state.copyWith(date: value));
              },
            ),
          ),
          Gap(16),
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
        onPopInvoked: onPopInvoked,
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

class UiDateTimeField extends StatefulWidget {
  const UiDateTimeField({
    required this.initialValue,
    required this.onChanged,
    this.use24HourFormat = false,
    super.key,
  });

  final DateTime initialValue;
  final bool use24HourFormat;
  final ValueChanged<DateTime> onChanged;

  @override
  State<UiDateTimeField> createState() => _UiDateTimeFieldState();
}

class _UiDateTimeFieldState extends State<UiDateTimeField> {
  late DateTime _selectedDateTime;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialValue;
    _timeController = TextEditingController(
      text: (widget.use24HourFormat ? DateFormat.Hm() : DateFormat.jm())
          .format(_selectedDateTime),
    );
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final context, final constraints) {
          final isDesktop = constraints.maxWidth > 600;
          if (isDesktop) {
            // Desktop layout
            return Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async => _showDatePicker(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      child: Text(DateFormat.yMMMd().format(_selectedDateTime)),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () async => _showTimePicker(
                      context,
                      use24HourFormat: widget.use24HourFormat,
                    ),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: 'Time',
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      child: Text(
                        widget.use24HourFormat
                            ? DateFormat.Hm().format(_selectedDateTime)
                            : DateFormat.jm().format(_selectedDateTime),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Mobile layout
            return SizedBox(
              height: 216,
              child: Row(
                children: [
                  Gap(16),
                  Flexible(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: _selectedDateTime,
                      onDateTimeChanged: (final newDate) {
                        setState(() {
                          _selectedDateTime = DateTime(
                            newDate.year,
                            newDate.month,
                            newDate.day,
                            _selectedDateTime.hour,
                            _selectedDateTime.minute,
                          );
                        });
                        widget.onChanged(_selectedDateTime);
                      },
                    ),
                  ),
                  Flexible(
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.time,
                      initialDateTime: _selectedDateTime,
                      onDateTimeChanged: (final newTime) {
                        setState(() {
                          _selectedDateTime = DateTime(
                            _selectedDateTime.year,
                            _selectedDateTime.month,
                            _selectedDateTime.day,
                            newTime.hour,
                            newTime.minute,
                          );
                        });
                        widget.onChanged(_selectedDateTime);
                      },
                    ),
                  ),
                  Gap(16),
                ],
              ),
            );
          }
        },
      );

  Future<void> _showDatePicker(final BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDateTime) {
      setState(() {
        _selectedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          _selectedDateTime.hour,
          _selectedDateTime.minute,
        );
      });
      widget.onChanged(_selectedDateTime);
    }
  }

  Future<void> _showTimePicker(
    final BuildContext context, {
    required final bool use24HourFormat,
  }) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (final context, final child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(alwaysUse24HourFormat: use24HourFormat),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          picked.hour,
          picked.minute,
        );
        _timeController.text =
            (use24HourFormat ? DateFormat.Hm() : DateFormat.jm())
                .format(_selectedDateTime);
      });
      widget.onChanged(_selectedDateTime);
    }
  }
}

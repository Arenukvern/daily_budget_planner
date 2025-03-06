import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';

class AddBudgetDialog extends HookWidget {
  const AddBudgetDialog({
    this.id = BudgetId.empty,
    super.key,
    this.initialValue,
  });

  final Transaction? initialValue;
  final BudgetId id;
  static Future<void> show(
    final BuildContext context, {
    final Transaction? initialValue,
  }) =>
      showDialog(
        context: context,
        builder: (final context) => AddBudgetDialog(initialValue: initialValue),
      );

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final amountController = useTextEditingController(
      text: initialValue?.input.amountWithTax.toString() ?? '',
    );
    final selectedDate =
        useState(initialValue?.transactionDate ?? DateTime.now());

    return AlertDialog(
      insetPadding:
          screenWidth < 400 ? const EdgeInsets.symmetric(horizontal: 4) : null,
      title: Text(
        LocalizedMap(
          value: {
            languages.en: 'Add New Budget',
            languages.it: 'Aggiungi Nuovo Budget',
            languages.ru: 'Добавить Новый Бюджет',
          },
        ).getValue(locale),
      ),
      content: _BudgetForm(
        amountController: amountController,
        selectedDate: selectedDate,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            LocalizedMap(
              value: {
                languages.en: 'Cancel',
                languages.it: 'Annulla',
                languages.ru: 'Отмена',
              },
            ).getValue(locale),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            if (Form.of(context).validate()) {
              final newBudget = Budget(
                id: BudgetId(id.value.whenEmptyUse(IdCreator.create())),
                input: InputMoney.fiat(
                  amountWithTax: double.parse(amountController.text),
                  // currencyId: CurrencyId.usd,
                ),
                date: selectedDate.value,
              );
              unawaited(const UpsertBudgetCommand().execute(newBudget));
              Navigator.of(context).pop();
            }
          },
          child: Text(
            LocalizedMap(
              value: {
                languages.en: 'Add',
                languages.it: 'Aggiungi',
                languages.ru: 'Добавить',
              },
            ).getValue(locale),
          ),
        ),
      ],
    );
  }
}

class _BudgetForm extends StatefulWidget {
  const _BudgetForm({
    required this.amountController,
    required this.selectedDate,
  });

  final TextEditingController amountController;
  final ValueNotifier<DateTime> selectedDate;
  @override
  State<_BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<_BudgetForm> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;

  DateTime get selectedDate => _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Form(
      key: _formKey,
      onPopInvokedWithResult: (final didPop, final result) {
        if (didPop) {
          unawaited(SoftKeyboard.close());
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: widget.amountController,
            decoration: InputDecoration(
              labelText: LocalizedMap(
                value: {
                  languages.en: 'Amount',
                  languages.it: 'Importo',
                  languages.ru: 'Сумма',
                },
              ).getValue(locale),
            ),
            autofocus: true,
            keyboardType: TextInputType.number,
            validator: (final value) {
              if (value == null || value.isEmpty) {
                return LocalizedMap(
                  value: {
                    languages.en: 'Please enter an amount',
                    languages.it: 'Inserisci un importo',
                    languages.ru: 'Пожалуйста, введите сумму',
                  },
                ).getValue(locale);
              }
              return null;
            },
          ),
          const Gap(16),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Date: ',
                    languages.it: 'Data: ',
                    languages.ru: 'Дата: ',
                  },
                ).getValue(locale),
              ),
              TextButton(
                onPressed: () async => _selectDateTime(context),
                child: Text(DateFormat.yMMMd().add_Hm().format(_selectedDate)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateTime(final BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate == null) return;
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDate),
    );
    if (pickedTime == null) return;
    setState(() {
      _selectedDate = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }
}

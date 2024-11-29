import 'package:mobile_app/common_imports.dart';

class TransactionTypeField extends StatelessWidget {
  const TransactionTypeField({
    required this.value,
    required this.onChanged,
    required this.currencyType,
    super.key,
  });
  final TransactionType value;
  final ValueSetter<TransactionType> onChanged;
  final CurrencyType currencyType;
  @override
  Widget build(final BuildContext context) {
    final transactionTypeNames = getTransactionTypeNames(
      currencyType: currencyType,
      locale: useLocale(context),
    );
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: CupertinoSlidingSegmentedControl<TransactionType>(
          groupValue: value,
          children: {
            for (final entry in transactionTypeNames.entries)
              entry.key: Text(entry.value),
          },
          onValueChanged: (final value) {
            if (value == null) return;
            onChanged(value);
          },
        ),
      ),
    );
  }
}

import 'package:mobile_app/common_imports.dart';

class CurrencyTypeField extends StatelessWidget {
  const CurrencyTypeField({
    required this.currencyType,
    required this.onChanged,
    super.key,
  });
  final CurrencyType currencyType;
  final ValueChanged<CurrencyType> onChanged;
  @override
  Widget build(final BuildContext context) => Center(
    child: SingleChildScrollView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      child: CupertinoSlidingSegmentedControl<CurrencyType>(
        groupValue: currencyType,
        children: const {
          CurrencyType.fiat: Text('Fiat'),
          CurrencyType.crypto: Text('Crypto'),
        },
        onValueChanged: (final value) {
          if (value == null) return;
          onChanged(value);
        },
      ),
    ),
  );
}

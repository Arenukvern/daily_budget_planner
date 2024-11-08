import 'package:mobile_app/common_imports.dart';

class CurrencyTypeField extends StatelessWidget {
  const CurrencyTypeField({
    required this.currencyType,
    required this.onChanged,
    this.isVisible = Envs.isCryptoEnabled,
    super.key,
  });
  final bool isVisible;
  final CurrencyType currencyType;
  final ValueChanged<CurrencyType> onChanged;
  @override
  Widget build(final BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();
    return Center(
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
            onChanged(value);
          },
        ),
      ),
    );
  }
}

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mobile_app/common_imports.dart';

class CoinPriceField extends StatelessWidget {
  const CoinPriceField({required this.controller, super.key});
  final TextEditingController controller;
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Padding(
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
            controller: controller,
            style: Theme.of(context).textTheme.titleLarge,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          );
        },
      ),
    );
  }
}

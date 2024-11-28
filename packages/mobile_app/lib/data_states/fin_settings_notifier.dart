import 'package:mobile_app/common_imports.dart';

CurrencyId useDefaultCurrencyId(
  final BuildContext context, {
  required final CurrencyType currencyType,
}) =>
    context.select<FinSettingsNotifier, CurrencyId>(
      (final c) => c.getDefaultCurrencyId(currencyType),
    );

class FinSettingsNotifier
    extends ValueNotifier<LoadableContainer<FinSettingsModel>>
    with HasLocalApis, HasStates {
  FinSettingsNotifier()
      : super(LoadableContainer(value: FinSettingsModel.empty));
  CurrencyId getDefaultCurrencyId(final CurrencyType type) => switch (type) {
        CurrencyType.fiat => value.value.fiatCurrencyId,
        CurrencyType.crypto => value.value.cryptoCurrencyId,
      };

  FinSettingsModel get settings => value.value;

  Future<void> onLoad() async {
    var effectiveSettings = await finSettingsLocalApi.loadSettings();
    CurrencyId getId(final CurrencyType type) =>
        dictionariesNotifier.getDefaultCurrencyId(type);
    if (effectiveSettings.cryptoCurrencyId.isEmpty) {
      effectiveSettings = effectiveSettings.copyWith(
        cryptoCurrencyId: getId(CurrencyType.crypto),
      );
    }
    if (effectiveSettings.fiatCurrencyId.isEmpty) {
      effectiveSettings =
          effectiveSettings.copyWith(fiatCurrencyId: getId(CurrencyType.fiat));
    }
    value = LoadableContainer.loaded(effectiveSettings);
  }
}

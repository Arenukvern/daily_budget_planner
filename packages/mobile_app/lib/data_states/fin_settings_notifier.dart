import 'package:mobile_app/common_imports.dart';

class FinSettingsNotifier
    extends ValueNotifier<LoadableContainer<FinSettingsModel>>
    with HasLocalApis, HasStates {
  FinSettingsNotifier()
      : super(LoadableContainer(value: FinSettingsModel.empty));
  CurrencyId getDefaultCurrencyId(final CurrencyType type) => switch (type) {
        CurrencyType.fiat => value.value.fiatCurrencyId,
        CurrencyType.crypto => value.value.cryptoCurrencyId,
      };
  Future<void> onLoad() async {
    var settings = await finSettingsLocalApi.loadSettings();
    CurrencyId getId(final CurrencyType type) =>
        dictionariesNotifier.getDefaultCurrencyId(type);
    if (settings.cryptoCurrencyId.isEmpty) {
      settings =
          settings.copyWith(cryptoCurrencyId: getId(CurrencyType.crypto));
    }
    if (settings.fiatCurrencyId.isEmpty) {
      settings = settings.copyWith(cryptoCurrencyId: getId(CurrencyType.fiat));
    }
    value = LoadableContainer.loaded(settings);
  }
}

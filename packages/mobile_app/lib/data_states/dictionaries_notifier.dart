import 'package:mobile_app/common_imports.dart';

class DictionariesNotifier extends ChangeNotifier with HasLocalApis, HasStates {
  DictionariesNotifier();
  bool isLoading = true;
  final fiatCurrencies = <CurrencyId, FiatCurrency>{};
  final cryptoCurrencies = <CurrencyId, CryptoCurrency>{};

  Iterable<CurrencyId> get fiatCurrenciesList =>
      fiatCurrencies.values.map((final e) => e.id);
  Iterable<CurrencyId> get cryptoCurrenciesList =>
      cryptoCurrencies.values.map((final e) => e.id);
  Currency getCurrency(final CurrencyId id, final CurrencyType type) =>
      switch (type) {
        CurrencyType.fiat => fiatCurrencies,
        CurrencyType.crypto => cryptoCurrencies,
      }[id]!;

  CurrencyId getDefaultCurrencyId(final CurrencyType type) {
    final language = localeNotifier.value.language;
    return switch (type) {
      CurrencyType.fiat => () {
          if (language == languages.en) {
            return fiatCurrencies.values
                .firstWhere((final e) => e.id.value.endsWith('USD'))
                .id;
          }
          if (language == languages.ru) {
            return fiatCurrencies.values
                .firstWhere((final e) => e.id.value.endsWith('RUB'))
                .id;
          }
          return fiatCurrencies.values.first.id;
        }(),
      CurrencyType.crypto => cryptoCurrencies.values.first.id,
    };
  }

  Future<void> onLoad() async {
    fiatCurrencies.addAll(
      {
        for (final c in await dictionariesLocalApi.loadFiatCurrencies())
          c.id: c,
      },
    );
    cryptoCurrencies.addAll(
      {
        for (final c in await dictionariesLocalApi.loadCryptoCurrencies())
          c.id: c,
      },
    );
    setState(() => isLoading = false);
  }

  void setState(final VoidCallback callback) {
    callback();
    notifyListeners();
  }
}

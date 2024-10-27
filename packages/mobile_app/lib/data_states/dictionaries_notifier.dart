import 'package:mobile_app/common_imports.dart';

class DictionariesNotifier extends ChangeNotifier with HasLocalApis {
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

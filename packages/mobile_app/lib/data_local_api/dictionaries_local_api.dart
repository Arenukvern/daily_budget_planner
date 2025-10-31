// ignore_for_file: use_raw_strings

import 'package:mobile_app/common_imports.dart';

const _fiatCurrenciesJson = [
  {
    'id': 'f_USD',
    'name': 'US Dollar',
    'slug': 'usd',
    'symbol': '\$',
    'decimals': 2,
    'units': [
      {'name': 'Cent', 'value': 0.01},
      {'name': 'Dollar', 'value': 1.0},
    ],
  },
  {
    'id': 'f_EUR',
    'name': 'Euro',
    'slug': 'eur',
    'symbol': '€',
    'decimals': 2,
    'units': [
      {'name': 'Cent', 'value': 0.01},
      {'name': 'Euro', 'value': 1.0},
    ],
  },
  {
    'id': 'f_RUB',
    'name': 'Russian Ruble',
    'slug': 'rub',
    'symbol': '₽',
    'decimals': 2,
    'units': [
      {'name': 'Kopeyka', 'value': 0.01},
      {'name': 'Ruble', 'value': 1.0},
    ],
  },
  {
    'id': 'f_JPY',
    'name': 'Japanese Yen',
    'slug': 'jpy',
    'symbol': '¥',
    'decimals': 0,
    'units': [
      {'name': 'Yen', 'value': 1.0},
    ],
  },
  {
    'id': 'f_CNY',
    'name': 'Chinese Yuan',
    'slug': 'cny',
    'symbol': '¥',
    'decimals': 2,
    'units': [
      {'name': 'Fen', 'value': 0.01},
      {'name': 'Jiao', 'value': 0.1},
      {'name': 'Yuan', 'value': 1.0},
    ],
  },
  {
    'id': 'f_INR',
    'name': 'Indian Rupee',
    'slug': 'inr',
    'symbol': '₹',
    'decimals': 2,
    'units': [
      {'name': 'Paisa', 'value': 0.01},
      {'name': 'Rupee', 'value': 1.0},
    ],
  },
  {
    'id': 'f_AED',
    'name': 'UAE Dirham',
    'slug': 'aed',
    'symbol': 'د.إ',
    'decimals': 2,
    'units': [
      {'name': 'Fils', 'value': 0.01},
      {'name': 'Dirham', 'value': 1.0},
    ],
  },
  {
    'id': 'f_ZAR',
    'name': 'South African Rand',
    'slug': 'zar',
    'symbol': 'R',
    'decimals': 2,
    'units': [
      {'name': 'Cent', 'value': 0.01},
      {'name': 'Rand', 'value': 1.0},
    ],
  },
];

const _cryptoCurrenciesJson = [
  {
    'id': 'c_BTC',
    'name': 'Bitcoin',
    'slug': 'btc',
    'symbol': '₿',
    'decimals': 8,
    'units': [
      {'name': 'Satoshi', 'value': 0.00000001},
    ],
  },
];

class DictionariesLocalApi {
  Future<List<FiatCurrency>> loadFiatCurrencies() async =>
      _fiatCurrenciesJson.map(FiatCurrency.fromJson).toList();
  Future<List<CryptoCurrency>> loadCryptoCurrencies() async =>
      _cryptoCurrenciesJson.map(CryptoCurrency.fromJson).toList();
}

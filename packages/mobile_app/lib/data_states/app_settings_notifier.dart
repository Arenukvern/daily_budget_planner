import 'package:flutter/foundation.dart';
import 'package:mobile_app/common_imports.dart';

class AppSettingsNotifier extends ValueNotifier<AppSettingsModel>
    with HasLocalApis, HasStates {
  AppSettingsNotifier() : super(AppSettingsModel.empty);

  Future<void> _updateSettings(final AppSettingsModel settings) async {
    value = settings;
    await appSettingsApi.saveSettings(settings: settings);
  }

  AppSettingsModel get settings => value;

  Future<void> onLoad() async {
    final settings = await appSettingsApi.loadSettings();
    await _updateSettings(settings);
    await updateLocale(value.locale);
  }

  Future<void> updateBrightness(final UiBrightness brightness) async {
    await _updateSettings(value.copyWith(brightness: brightness));
  }

  ValueListenable<Locale> get locale => localeNotifier;
  UiLanguage get language => locale.value.language;
  Future<void> updateLocale(final Locale? locale) async {
    final result = await LocaleLogic().updateLocale(
      newLocale: locale,
      oldLocale: value.locale,
      uiLocale: localeNotifier.value,
      onLocaleChanged: S.delegate.load,
    );
    if (result == null) return;
    localeNotifier.value = result.uiLocale;
    notifyListeners();
    if (value.locale == result.updatedLocale) return;
    await _updateSettings(value.copyWith(locale: result.updatedLocale));
  }

  bool get use24HourFormat => value.use24HourFormat;
}

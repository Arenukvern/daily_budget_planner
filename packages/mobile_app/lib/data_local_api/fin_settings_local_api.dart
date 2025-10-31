import 'package:mobile_app/common_imports.dart';

class FinSettingsLocalApi with HasLocalApis {
  static const _persistenceKey = 'fin_settings';
  Future<void> saveSettings({required final FinSettingsModel settings}) async {
    await localDb.setItem(
      key: _persistenceKey,
      value: settings,
      toJson: (final instance) => instance.toJson(),
    );
  }

  Future<FinSettingsModel> loadSettings() => localDb.getItem(
    key: _persistenceKey,
    defaultValue: FinSettingsModel.empty,
    fromJson:
        (final json) => json.isEmpty ? null : FinSettingsModel.fromJson(json),
  );
}

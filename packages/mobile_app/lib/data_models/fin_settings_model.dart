part of 'data_models.dart';

@freezed
abstract class FinSettingsModel with _$FinSettingsModel {
  const factory FinSettingsModel({
    @Default(CurrencyId.empty) final CurrencyId fiatCurrencyId,
    @Default(CurrencyId.empty) final CurrencyId cryptoCurrencyId,
  }) = _FinSettingsModel;
  factory FinSettingsModel.fromJson(final Map<String, dynamic> json) =>
      _$FinSettingsModelFromJson(json);
  static const empty = FinSettingsModel();
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) {
  return _AppSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingsModel {
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale => throw _privateConstructorUsedError;
  @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
  UiBrightness get brightness => throw _privateConstructorUsedError;

  /// Serializes this AppSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSettingsModelCopyWith<AppSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsModelCopyWith<$Res> {
  factory $AppSettingsModelCopyWith(
          AppSettingsModel value, $Res Function(AppSettingsModel) then) =
      _$AppSettingsModelCopyWithImpl<$Res, AppSettingsModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale,
      @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
      UiBrightness brightness});
}

/// @nodoc
class _$AppSettingsModelCopyWithImpl<$Res, $Val extends AppSettingsModel>
    implements $AppSettingsModelCopyWith<$Res> {
  _$AppSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? brightness = null,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as UiBrightness,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsModelImplCopyWith<$Res>
    implements $AppSettingsModelCopyWith<$Res> {
  factory _$$AppSettingsModelImplCopyWith(_$AppSettingsModelImpl value,
          $Res Function(_$AppSettingsModelImpl) then) =
      __$$AppSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
      Locale? locale,
      @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
      UiBrightness brightness});
}

/// @nodoc
class __$$AppSettingsModelImplCopyWithImpl<$Res>
    extends _$AppSettingsModelCopyWithImpl<$Res, _$AppSettingsModelImpl>
    implements _$$AppSettingsModelImplCopyWith<$Res> {
  __$$AppSettingsModelImplCopyWithImpl(_$AppSettingsModelImpl _value,
      $Res Function(_$AppSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = freezed,
    Object? brightness = null,
  }) {
    return _then(_$AppSettingsModelImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
      brightness: null == brightness
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as UiBrightness,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AppSettingsModelImpl extends _AppSettingsModel {
  const _$AppSettingsModelImpl(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString) this.locale,
      @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
      this.brightness = UiBrightness.system})
      : super._();

  factory _$AppSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingsModelImplFromJson(json);

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  final Locale? locale;
  @override
  @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
  final UiBrightness brightness;

  @override
  String toString() {
    return 'AppSettingsModel(locale: $locale, brightness: $brightness)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsModelImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.brightness, brightness) ||
                other.brightness == brightness));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, locale, brightness);

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      __$$AppSettingsModelImplCopyWithImpl<_$AppSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _AppSettingsModel extends AppSettingsModel {
  const factory _AppSettingsModel(
      {@JsonKey(fromJson: localeFromString, toJson: localeToString)
      final Locale? locale,
      @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
      final UiBrightness brightness}) = _$AppSettingsModelImpl;
  const _AppSettingsModel._() : super._();

  factory _AppSettingsModel.fromJson(Map<String, dynamic> json) =
      _$AppSettingsModelImpl.fromJson;

  @override
  @JsonKey(fromJson: localeFromString, toJson: localeToString)
  Locale? get locale;
  @override
  @JsonKey(fromJson: UiBrightness.fromJson, toJson: UiBrightness.toJson)
  UiBrightness get brightness;

  /// Create a copy of AppSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSettingsModelImplCopyWith<_$AppSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetModelId {
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetModelIdCopyWith<BudgetModelId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelIdCopyWith<$Res> {
  factory $BudgetModelIdCopyWith(
          BudgetModelId value, $Res Function(BudgetModelId) then) =
      _$BudgetModelIdCopyWithImpl<$Res, BudgetModelId>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$BudgetModelIdCopyWithImpl<$Res, $Val extends BudgetModelId>
    implements $BudgetModelIdCopyWith<$Res> {
  _$BudgetModelIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetModelIdImplCopyWith<$Res>
    implements $BudgetModelIdCopyWith<$Res> {
  factory _$$BudgetModelIdImplCopyWith(
          _$BudgetModelIdImpl value, $Res Function(_$BudgetModelIdImpl) then) =
      __$$BudgetModelIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$BudgetModelIdImplCopyWithImpl<$Res>
    extends _$BudgetModelIdCopyWithImpl<$Res, _$BudgetModelIdImpl>
    implements _$$BudgetModelIdImplCopyWith<$Res> {
  __$$BudgetModelIdImplCopyWithImpl(
      _$BudgetModelIdImpl _value, $Res Function(_$BudgetModelIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$BudgetModelIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BudgetModelIdImpl extends _BudgetModelId {
  const _$BudgetModelIdImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'BudgetModelId(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelIdImplCopyWith<_$BudgetModelIdImpl> get copyWith =>
      __$$BudgetModelIdImplCopyWithImpl<_$BudgetModelIdImpl>(this, _$identity);
}

abstract class _BudgetModelId extends BudgetModelId {
  const factory _BudgetModelId({required final String value}) =
      _$BudgetModelIdImpl;
  const _BudgetModelId._() : super._();

  @override
  String get value;

  /// Create a copy of BudgetModelId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetModelIdImplCopyWith<_$BudgetModelIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyBudgetModel _$MonthlyBudgetModelFromJson(Map<String, dynamic> json) {
  return _MonthlyBudgetModel.fromJson(json);
}

/// @nodoc
mixin _$MonthlyBudgetModel {
  BudgetModelId get id => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: dateTimeFromMilisecondsSinceEpoch,
      toJson: dateTimeToMilisecondsSinceEpoch)
  DateTime? get nextBudgetDay => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get savings => throw _privateConstructorUsedError;

  /// Serializes this MonthlyBudgetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyBudgetModelCopyWith<MonthlyBudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyBudgetModelCopyWith<$Res> {
  factory $MonthlyBudgetModelCopyWith(
          MonthlyBudgetModel value, $Res Function(MonthlyBudgetModel) then) =
      _$MonthlyBudgetModelCopyWithImpl<$Res, MonthlyBudgetModel>;
  @useResult
  $Res call(
      {BudgetModelId id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      DateTime? nextBudgetDay,
      double amount,
      double savings});

  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class _$MonthlyBudgetModelCopyWithImpl<$Res, $Val extends MonthlyBudgetModel>
    implements $MonthlyBudgetModelCopyWith<$Res> {
  _$MonthlyBudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nextBudgetDay = freezed,
    Object? amount = null,
    Object? savings = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      nextBudgetDay: freezed == nextBudgetDay
          ? _value.nextBudgetDay
          : nextBudgetDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetModelIdCopyWith<$Res> get id {
    return $BudgetModelIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MonthlyBudgetModelImplCopyWith<$Res>
    implements $MonthlyBudgetModelCopyWith<$Res> {
  factory _$$MonthlyBudgetModelImplCopyWith(_$MonthlyBudgetModelImpl value,
          $Res Function(_$MonthlyBudgetModelImpl) then) =
      __$$MonthlyBudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BudgetModelId id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      DateTime? nextBudgetDay,
      double amount,
      double savings});

  @override
  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$MonthlyBudgetModelImplCopyWithImpl<$Res>
    extends _$MonthlyBudgetModelCopyWithImpl<$Res, _$MonthlyBudgetModelImpl>
    implements _$$MonthlyBudgetModelImplCopyWith<$Res> {
  __$$MonthlyBudgetModelImplCopyWithImpl(_$MonthlyBudgetModelImpl _value,
      $Res Function(_$MonthlyBudgetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nextBudgetDay = freezed,
    Object? amount = null,
    Object? savings = null,
  }) {
    return _then(_$MonthlyBudgetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      nextBudgetDay: freezed == nextBudgetDay
          ? _value.nextBudgetDay
          : nextBudgetDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyBudgetModelImpl implements _MonthlyBudgetModel {
  const _$MonthlyBudgetModelImpl(
      {required this.id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      this.nextBudgetDay,
      this.amount = 0,
      this.savings = 0});

  factory _$MonthlyBudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyBudgetModelImplFromJson(json);

  @override
  final BudgetModelId id;
  @override
  @JsonKey(
      fromJson: dateTimeFromMilisecondsSinceEpoch,
      toJson: dateTimeToMilisecondsSinceEpoch)
  final DateTime? nextBudgetDay;
  @override
  @JsonKey()
  final double amount;
  @override
  @JsonKey()
  final double savings;

  @override
  String toString() {
    return 'MonthlyBudgetModel(id: $id, nextBudgetDay: $nextBudgetDay, amount: $amount, savings: $savings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyBudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nextBudgetDay, nextBudgetDay) ||
                other.nextBudgetDay == nextBudgetDay) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.savings, savings) || other.savings == savings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nextBudgetDay, amount, savings);

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyBudgetModelImplCopyWith<_$MonthlyBudgetModelImpl> get copyWith =>
      __$$MonthlyBudgetModelImplCopyWithImpl<_$MonthlyBudgetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyBudgetModelImplToJson(
      this,
    );
  }
}

abstract class _MonthlyBudgetModel implements MonthlyBudgetModel {
  const factory _MonthlyBudgetModel(
      {required final BudgetModelId id,
      @JsonKey(
          fromJson: dateTimeFromMilisecondsSinceEpoch,
          toJson: dateTimeToMilisecondsSinceEpoch)
      final DateTime? nextBudgetDay,
      final double amount,
      final double savings}) = _$MonthlyBudgetModelImpl;

  factory _MonthlyBudgetModel.fromJson(Map<String, dynamic> json) =
      _$MonthlyBudgetModelImpl.fromJson;

  @override
  BudgetModelId get id;
  @override
  @JsonKey(
      fromJson: dateTimeFromMilisecondsSinceEpoch,
      toJson: dateTimeToMilisecondsSinceEpoch)
  DateTime? get nextBudgetDay;
  @override
  double get amount;
  @override
  double get savings;

  /// Create a copy of MonthlyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyBudgetModelImplCopyWith<_$MonthlyBudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyBudgetModel _$WeeklyBudgetModelFromJson(Map<String, dynamic> json) {
  return _WeeklyBudgetModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyBudgetModel {
  BudgetModelId get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this WeeklyBudgetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyBudgetModelCopyWith<WeeklyBudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyBudgetModelCopyWith<$Res> {
  factory $WeeklyBudgetModelCopyWith(
          WeeklyBudgetModel value, $Res Function(WeeklyBudgetModel) then) =
      _$WeeklyBudgetModelCopyWithImpl<$Res, WeeklyBudgetModel>;
  @useResult
  $Res call({BudgetModelId id, double amount});

  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class _$WeeklyBudgetModelCopyWithImpl<$Res, $Val extends WeeklyBudgetModel>
    implements $WeeklyBudgetModelCopyWith<$Res> {
  _$WeeklyBudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BudgetModelIdCopyWith<$Res> get id {
    return $BudgetModelIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeeklyBudgetModelImplCopyWith<$Res>
    implements $WeeklyBudgetModelCopyWith<$Res> {
  factory _$$WeeklyBudgetModelImplCopyWith(_$WeeklyBudgetModelImpl value,
          $Res Function(_$WeeklyBudgetModelImpl) then) =
      __$$WeeklyBudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BudgetModelId id, double amount});

  @override
  $BudgetModelIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$WeeklyBudgetModelImplCopyWithImpl<$Res>
    extends _$WeeklyBudgetModelCopyWithImpl<$Res, _$WeeklyBudgetModelImpl>
    implements _$$WeeklyBudgetModelImplCopyWith<$Res> {
  __$$WeeklyBudgetModelImplCopyWithImpl(_$WeeklyBudgetModelImpl _value,
      $Res Function(_$WeeklyBudgetModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
  }) {
    return _then(_$WeeklyBudgetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetModelId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyBudgetModelImpl implements _WeeklyBudgetModel {
  const _$WeeklyBudgetModelImpl({required this.id, this.amount = 0});

  factory _$WeeklyBudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyBudgetModelImplFromJson(json);

  @override
  final BudgetModelId id;
  @override
  @JsonKey()
  final double amount;

  @override
  String toString() {
    return 'WeeklyBudgetModel(id: $id, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyBudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount);

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyBudgetModelImplCopyWith<_$WeeklyBudgetModelImpl> get copyWith =>
      __$$WeeklyBudgetModelImplCopyWithImpl<_$WeeklyBudgetModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyBudgetModelImplToJson(
      this,
    );
  }
}

abstract class _WeeklyBudgetModel implements WeeklyBudgetModel {
  const factory _WeeklyBudgetModel(
      {required final BudgetModelId id,
      final double amount}) = _$WeeklyBudgetModelImpl;

  factory _WeeklyBudgetModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyBudgetModelImpl.fromJson;

  @override
  BudgetModelId get id;
  @override
  double get amount;

  /// Create a copy of WeeklyBudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyBudgetModelImplCopyWith<_$WeeklyBudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FinSettingsModel _$FinSettingsModelFromJson(Map<String, dynamic> json) {
  return _FinSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$FinSettingsModel {
  CurrencyId get fiatCurrencyId => throw _privateConstructorUsedError;
  CurrencyId get cryptoCurrencyId => throw _privateConstructorUsedError;

  /// Serializes this FinSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinSettingsModelCopyWith<FinSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinSettingsModelCopyWith<$Res> {
  factory $FinSettingsModelCopyWith(
          FinSettingsModel value, $Res Function(FinSettingsModel) then) =
      _$FinSettingsModelCopyWithImpl<$Res, FinSettingsModel>;
  @useResult
  $Res call({CurrencyId fiatCurrencyId, CurrencyId cryptoCurrencyId});
}

/// @nodoc
class _$FinSettingsModelCopyWithImpl<$Res, $Val extends FinSettingsModel>
    implements $FinSettingsModelCopyWith<$Res> {
  _$FinSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fiatCurrencyId = null,
    Object? cryptoCurrencyId = null,
  }) {
    return _then(_value.copyWith(
      fiatCurrencyId: null == fiatCurrencyId
          ? _value.fiatCurrencyId
          : fiatCurrencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      cryptoCurrencyId: null == cryptoCurrencyId
          ? _value.cryptoCurrencyId
          : cryptoCurrencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinSettingsModelImplCopyWith<$Res>
    implements $FinSettingsModelCopyWith<$Res> {
  factory _$$FinSettingsModelImplCopyWith(_$FinSettingsModelImpl value,
          $Res Function(_$FinSettingsModelImpl) then) =
      __$$FinSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CurrencyId fiatCurrencyId, CurrencyId cryptoCurrencyId});
}

/// @nodoc
class __$$FinSettingsModelImplCopyWithImpl<$Res>
    extends _$FinSettingsModelCopyWithImpl<$Res, _$FinSettingsModelImpl>
    implements _$$FinSettingsModelImplCopyWith<$Res> {
  __$$FinSettingsModelImplCopyWithImpl(_$FinSettingsModelImpl _value,
      $Res Function(_$FinSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fiatCurrencyId = null,
    Object? cryptoCurrencyId = null,
  }) {
    return _then(_$FinSettingsModelImpl(
      fiatCurrencyId: null == fiatCurrencyId
          ? _value.fiatCurrencyId
          : fiatCurrencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      cryptoCurrencyId: null == cryptoCurrencyId
          ? _value.cryptoCurrencyId
          : cryptoCurrencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinSettingsModelImpl implements _FinSettingsModel {
  const _$FinSettingsModelImpl(
      {this.fiatCurrencyId = CurrencyId.empty,
      this.cryptoCurrencyId = CurrencyId.empty});

  factory _$FinSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinSettingsModelImplFromJson(json);

  @override
  @JsonKey()
  final CurrencyId fiatCurrencyId;
  @override
  @JsonKey()
  final CurrencyId cryptoCurrencyId;

  @override
  String toString() {
    return 'FinSettingsModel(fiatCurrencyId: $fiatCurrencyId, cryptoCurrencyId: $cryptoCurrencyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinSettingsModelImpl &&
            (identical(other.fiatCurrencyId, fiatCurrencyId) ||
                other.fiatCurrencyId == fiatCurrencyId) &&
            (identical(other.cryptoCurrencyId, cryptoCurrencyId) ||
                other.cryptoCurrencyId == cryptoCurrencyId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fiatCurrencyId, cryptoCurrencyId);

  /// Create a copy of FinSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinSettingsModelImplCopyWith<_$FinSettingsModelImpl> get copyWith =>
      __$$FinSettingsModelImplCopyWithImpl<_$FinSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _FinSettingsModel implements FinSettingsModel {
  const factory _FinSettingsModel(
      {final CurrencyId fiatCurrencyId,
      final CurrencyId cryptoCurrencyId}) = _$FinSettingsModelImpl;

  factory _FinSettingsModel.fromJson(Map<String, dynamic> json) =
      _$FinSettingsModelImpl.fromJson;

  @override
  CurrencyId get fiatCurrencyId;
  @override
  CurrencyId get cryptoCurrencyId;

  /// Create a copy of FinSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinSettingsModelImplCopyWith<_$FinSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  TaskId get id => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  PersonalIncomeTaskType get personalIncomeType =>
      throw _privateConstructorUsedError;
  PersonalExpenseTaskType get personalExpenseType =>
      throw _privateConstructorUsedError;
  TaskTransactionType get transactionType => throw _privateConstructorUsedError;
  List<CategoryId> get categoryIds => throw _privateConstructorUsedError;
  List<ScheduledTransaction> get schedules =>
      throw _privateConstructorUsedError;

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {TaskId id,
      TaskStatus status,
      String title,
      String notes,
      TaskType type,
      PersonalIncomeTaskType personalIncomeType,
      PersonalExpenseTaskType personalExpenseType,
      TaskTransactionType transactionType,
      List<CategoryId> categoryIds,
      List<ScheduledTransaction> schedules});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? title = null,
    Object? notes = null,
    Object? type = null,
    Object? personalIncomeType = null,
    Object? personalExpenseType = null,
    Object? transactionType = null,
    Object? categoryIds = null,
    Object? schedules = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      personalIncomeType: null == personalIncomeType
          ? _value.personalIncomeType
          : personalIncomeType // ignore: cast_nullable_to_non_nullable
              as PersonalIncomeTaskType,
      personalExpenseType: null == personalExpenseType
          ? _value.personalExpenseType
          : personalExpenseType // ignore: cast_nullable_to_non_nullable
              as PersonalExpenseTaskType,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TaskTransactionType,
      categoryIds: null == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<CategoryId>,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduledTransaction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskId id,
      TaskStatus status,
      String title,
      String notes,
      TaskType type,
      PersonalIncomeTaskType personalIncomeType,
      PersonalExpenseTaskType personalExpenseType,
      TaskTransactionType transactionType,
      List<CategoryId> categoryIds,
      List<ScheduledTransaction> schedules});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? title = null,
    Object? notes = null,
    Object? type = null,
    Object? personalIncomeType = null,
    Object? personalExpenseType = null,
    Object? transactionType = null,
    Object? categoryIds = null,
    Object? schedules = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TaskId,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TaskType,
      personalIncomeType: null == personalIncomeType
          ? _value.personalIncomeType
          : personalIncomeType // ignore: cast_nullable_to_non_nullable
              as PersonalIncomeTaskType,
      personalExpenseType: null == personalExpenseType
          ? _value.personalExpenseType
          : personalExpenseType // ignore: cast_nullable_to_non_nullable
              as PersonalExpenseTaskType,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TaskTransactionType,
      categoryIds: null == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<CategoryId>,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<ScheduledTransaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskImpl extends _Task {
  const _$TaskImpl(
      {this.id = TaskId.empty,
      this.status = TaskStatus.visible,
      this.title = '',
      this.notes = '',
      this.type = TaskType.personal,
      this.personalIncomeType = PersonalIncomeTaskType.salary,
      this.personalExpenseType = PersonalExpenseTaskType.other,
      this.transactionType = TaskTransactionType.income,
      final List<CategoryId> categoryIds = const [],
      final List<ScheduledTransaction> schedules = const []})
      : _categoryIds = categoryIds,
        _schedules = schedules,
        super._();

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  @JsonKey()
  final TaskId id;
  @override
  @JsonKey()
  final TaskStatus status;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String notes;
  @override
  @JsonKey()
  final TaskType type;
  @override
  @JsonKey()
  final PersonalIncomeTaskType personalIncomeType;
  @override
  @JsonKey()
  final PersonalExpenseTaskType personalExpenseType;
  @override
  @JsonKey()
  final TaskTransactionType transactionType;
  final List<CategoryId> _categoryIds;
  @override
  @JsonKey()
  List<CategoryId> get categoryIds {
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryIds);
  }

  final List<ScheduledTransaction> _schedules;
  @override
  @JsonKey()
  List<ScheduledTransaction> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  String toString() {
    return 'Task(id: $id, status: $status, title: $title, notes: $notes, type: $type, personalIncomeType: $personalIncomeType, personalExpenseType: $personalExpenseType, transactionType: $transactionType, categoryIds: $categoryIds, schedules: $schedules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.personalIncomeType, personalIncomeType) ||
                other.personalIncomeType == personalIncomeType) &&
            (identical(other.personalExpenseType, personalExpenseType) ||
                other.personalExpenseType == personalExpenseType) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      title,
      notes,
      type,
      personalIncomeType,
      personalExpenseType,
      transactionType,
      const DeepCollectionEquality().hash(_categoryIds),
      const DeepCollectionEquality().hash(_schedules));

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task extends Task {
  const factory _Task(
      {final TaskId id,
      final TaskStatus status,
      final String title,
      final String notes,
      final TaskType type,
      final PersonalIncomeTaskType personalIncomeType,
      final PersonalExpenseTaskType personalExpenseType,
      final TaskTransactionType transactionType,
      final List<CategoryId> categoryIds,
      final List<ScheduledTransaction> schedules}) = _$TaskImpl;
  const _Task._() : super._();

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  TaskId get id;
  @override
  TaskStatus get status;
  @override
  String get title;
  @override
  String get notes;
  @override
  TaskType get type;
  @override
  PersonalIncomeTaskType get personalIncomeType;
  @override
  PersonalExpenseTaskType get personalExpenseType;
  @override
  TaskTransactionType get transactionType;
  @override
  List<CategoryId> get categoryIds;
  @override
  List<ScheduledTransaction> get schedules;

  /// Create a copy of Task
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduledTransaction _$ScheduledTransactionFromJson(Map<String, dynamic> json) {
  return _ScheduledTransaction.fromJson(json);
}

/// @nodoc
mixin _$ScheduledTransaction {
  TransactionId get transactionId => throw _privateConstructorUsedError;
  TransactionSchedule get schedule => throw _privateConstructorUsedError;

  /// Serializes this ScheduledTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduledTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduledTransactionCopyWith<ScheduledTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduledTransactionCopyWith<$Res> {
  factory $ScheduledTransactionCopyWith(ScheduledTransaction value,
          $Res Function(ScheduledTransaction) then) =
      _$ScheduledTransactionCopyWithImpl<$Res, ScheduledTransaction>;
  @useResult
  $Res call({TransactionId transactionId, TransactionSchedule schedule});

  $TransactionScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class _$ScheduledTransactionCopyWithImpl<$Res,
        $Val extends ScheduledTransaction>
    implements $ScheduledTransactionCopyWith<$Res> {
  _$ScheduledTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduledTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? schedule = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as TransactionSchedule,
    ) as $Val);
  }

  /// Create a copy of ScheduledTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionScheduleCopyWith<$Res> get schedule {
    return $TransactionScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ScheduledTransactionImplCopyWith<$Res>
    implements $ScheduledTransactionCopyWith<$Res> {
  factory _$$ScheduledTransactionImplCopyWith(_$ScheduledTransactionImpl value,
          $Res Function(_$ScheduledTransactionImpl) then) =
      __$$ScheduledTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionId transactionId, TransactionSchedule schedule});

  @override
  $TransactionScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class __$$ScheduledTransactionImplCopyWithImpl<$Res>
    extends _$ScheduledTransactionCopyWithImpl<$Res, _$ScheduledTransactionImpl>
    implements _$$ScheduledTransactionImplCopyWith<$Res> {
  __$$ScheduledTransactionImplCopyWithImpl(_$ScheduledTransactionImpl _value,
      $Res Function(_$ScheduledTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScheduledTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? schedule = null,
  }) {
    return _then(_$ScheduledTransactionImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as TransactionSchedule,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduledTransactionImpl extends _ScheduledTransaction {
  const _$ScheduledTransactionImpl(
      {this.transactionId = TransactionId.empty,
      this.schedule = TransactionSchedule.empty})
      : super._();

  factory _$ScheduledTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduledTransactionImplFromJson(json);

  @override
  @JsonKey()
  final TransactionId transactionId;
  @override
  @JsonKey()
  final TransactionSchedule schedule;

  @override
  String toString() {
    return 'ScheduledTransaction(transactionId: $transactionId, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduledTransactionImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionId, schedule);

  /// Create a copy of ScheduledTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduledTransactionImplCopyWith<_$ScheduledTransactionImpl>
      get copyWith =>
          __$$ScheduledTransactionImplCopyWithImpl<_$ScheduledTransactionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduledTransactionImplToJson(
      this,
    );
  }
}

abstract class _ScheduledTransaction extends ScheduledTransaction {
  const factory _ScheduledTransaction(
      {final TransactionId transactionId,
      final TransactionSchedule schedule}) = _$ScheduledTransactionImpl;
  const _ScheduledTransaction._() : super._();

  factory _ScheduledTransaction.fromJson(Map<String, dynamic> json) =
      _$ScheduledTransactionImpl.fromJson;

  @override
  TransactionId get transactionId;
  @override
  TransactionSchedule get schedule;

  /// Create a copy of ScheduledTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduledTransactionImplCopyWith<_$ScheduledTransactionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionSchedule _$TransactionScheduleFromJson(Map<String, dynamic> json) {
  return _TransactionSchedule.fromJson(json);
}

/// @nodoc
mixin _$TransactionSchedule {
  TransactionPeriodType get periodType => throw _privateConstructorUsedError;
  Period get period => throw _privateConstructorUsedError;
  int get dayOfMonth => throw _privateConstructorUsedError;
  int get dayOfWeek => throw _privateConstructorUsedError;
  int get dayOfQuarter => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;

  /// Serializes this TransactionSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionScheduleCopyWith<TransactionSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionScheduleCopyWith<$Res> {
  factory $TransactionScheduleCopyWith(
          TransactionSchedule value, $Res Function(TransactionSchedule) then) =
      _$TransactionScheduleCopyWithImpl<$Res, TransactionSchedule>;
  @useResult
  $Res call(
      {TransactionPeriodType periodType,
      Period period,
      int dayOfMonth,
      int dayOfWeek,
      int dayOfQuarter,
      DateTime? date});
}

/// @nodoc
class _$TransactionScheduleCopyWithImpl<$Res, $Val extends TransactionSchedule>
    implements $TransactionScheduleCopyWith<$Res> {
  _$TransactionScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodType = null,
    Object? period = null,
    Object? dayOfMonth = null,
    Object? dayOfWeek = null,
    Object? dayOfQuarter = null,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      periodType: null == periodType
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as TransactionPeriodType,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
      dayOfMonth: null == dayOfMonth
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfQuarter: null == dayOfQuarter
          ? _value.dayOfQuarter
          : dayOfQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionScheduleImplCopyWith<$Res>
    implements $TransactionScheduleCopyWith<$Res> {
  factory _$$TransactionScheduleImplCopyWith(_$TransactionScheduleImpl value,
          $Res Function(_$TransactionScheduleImpl) then) =
      __$$TransactionScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionPeriodType periodType,
      Period period,
      int dayOfMonth,
      int dayOfWeek,
      int dayOfQuarter,
      DateTime? date});
}

/// @nodoc
class __$$TransactionScheduleImplCopyWithImpl<$Res>
    extends _$TransactionScheduleCopyWithImpl<$Res, _$TransactionScheduleImpl>
    implements _$$TransactionScheduleImplCopyWith<$Res> {
  __$$TransactionScheduleImplCopyWithImpl(_$TransactionScheduleImpl _value,
      $Res Function(_$TransactionScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? periodType = null,
    Object? period = null,
    Object? dayOfMonth = null,
    Object? dayOfWeek = null,
    Object? dayOfQuarter = null,
    Object? date = freezed,
  }) {
    return _then(_$TransactionScheduleImpl(
      periodType: null == periodType
          ? _value.periodType
          : periodType // ignore: cast_nullable_to_non_nullable
              as TransactionPeriodType,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
      dayOfMonth: null == dayOfMonth
          ? _value.dayOfMonth
          : dayOfMonth // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfQuarter: null == dayOfQuarter
          ? _value.dayOfQuarter
          : dayOfQuarter // ignore: cast_nullable_to_non_nullable
              as int,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionScheduleImpl extends _TransactionSchedule {
  const _$TransactionScheduleImpl(
      {this.periodType = TransactionPeriodType.none,
      this.period = Period.daily,
      this.dayOfMonth = 0,
      this.dayOfWeek = 0,
      this.dayOfQuarter = 0,
      this.date})
      : super._();

  factory _$TransactionScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionScheduleImplFromJson(json);

  @override
  @JsonKey()
  final TransactionPeriodType periodType;
  @override
  @JsonKey()
  final Period period;
  @override
  @JsonKey()
  final int dayOfMonth;
  @override
  @JsonKey()
  final int dayOfWeek;
  @override
  @JsonKey()
  final int dayOfQuarter;
  @override
  final DateTime? date;

  @override
  String toString() {
    return 'TransactionSchedule(periodType: $periodType, period: $period, dayOfMonth: $dayOfMonth, dayOfWeek: $dayOfWeek, dayOfQuarter: $dayOfQuarter, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionScheduleImpl &&
            (identical(other.periodType, periodType) ||
                other.periodType == periodType) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.dayOfMonth, dayOfMonth) ||
                other.dayOfMonth == dayOfMonth) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.dayOfQuarter, dayOfQuarter) ||
                other.dayOfQuarter == dayOfQuarter) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, periodType, period, dayOfMonth,
      dayOfWeek, dayOfQuarter, date);

  /// Create a copy of TransactionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionScheduleImplCopyWith<_$TransactionScheduleImpl> get copyWith =>
      __$$TransactionScheduleImplCopyWithImpl<_$TransactionScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionScheduleImplToJson(
      this,
    );
  }
}

abstract class _TransactionSchedule extends TransactionSchedule {
  const factory _TransactionSchedule(
      {final TransactionPeriodType periodType,
      final Period period,
      final int dayOfMonth,
      final int dayOfWeek,
      final int dayOfQuarter,
      final DateTime? date}) = _$TransactionScheduleImpl;
  const _TransactionSchedule._() : super._();

  factory _TransactionSchedule.fromJson(Map<String, dynamic> json) =
      _$TransactionScheduleImpl.fromJson;

  @override
  TransactionPeriodType get periodType;
  @override
  Period get period;
  @override
  int get dayOfMonth;
  @override
  int get dayOfWeek;
  @override
  int get dayOfQuarter;
  @override
  DateTime? get date;

  /// Create a copy of TransactionSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionScheduleImplCopyWith<_$TransactionScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'fiat':
      return FiatCurrency.fromJson(json);
    case 'crypto':
      return CryptoCurrency.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Currency',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Currency {
  CurrencyId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  CurrencyType get type => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrencyId id, String name, String slug,
            String symbol, int decimals, CurrencyType type)
        fiat,
    required TResult Function(CurrencyId id, String name, String slug,
            CurrencyType type, ChainId chainId)
        crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId id, String name, String slug, String symbol,
            int decimals, CurrencyType type)?
        fiat,
    TResult? Function(CurrencyId id, String name, String slug,
            CurrencyType type, ChainId chainId)?
        crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId id, String name, String slug, String symbol,
            int decimals, CurrencyType type)?
        fiat,
    TResult Function(CurrencyId id, String name, String slug, CurrencyType type,
            ChainId chainId)?
        crypto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FiatCurrency value) fiat,
    required TResult Function(CryptoCurrency value) crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FiatCurrency value)? fiat,
    TResult? Function(CryptoCurrency value)? crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FiatCurrency value)? fiat,
    TResult Function(CryptoCurrency value)? crypto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Currency to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call({CurrencyId id, String name, String slug, CurrencyType type});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiatCurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$FiatCurrencyImplCopyWith(
          _$FiatCurrencyImpl value, $Res Function(_$FiatCurrencyImpl) then) =
      __$$FiatCurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyId id,
      String name,
      String slug,
      String symbol,
      int decimals,
      CurrencyType type});
}

/// @nodoc
class __$$FiatCurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$FiatCurrencyImpl>
    implements _$$FiatCurrencyImplCopyWith<$Res> {
  __$$FiatCurrencyImplCopyWithImpl(
      _$FiatCurrencyImpl _value, $Res Function(_$FiatCurrencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? symbol = null,
    Object? decimals = null,
    Object? type = null,
  }) {
    return _then(_$FiatCurrencyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: null == decimals
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FiatCurrencyImpl extends FiatCurrency {
  const _$FiatCurrencyImpl(
      {this.id = CurrencyId.empty,
      this.name = '',
      this.slug = '',
      this.symbol = '',
      this.decimals = 2,
      this.type = CurrencyType.fiat,
      final String? $type})
      : $type = $type ?? 'fiat',
        super._();

  factory _$FiatCurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiatCurrencyImplFromJson(json);

  @override
  @JsonKey()
  final CurrencyId id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String slug;
  @override
  @JsonKey()
  final String symbol;
  @override
  @JsonKey()
  final int decimals;
  @override
  @JsonKey()
  final CurrencyType type;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Currency.fiat(id: $id, name: $name, slug: $slug, symbol: $symbol, decimals: $decimals, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiatCurrencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.decimals, decimals) ||
                other.decimals == decimals) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, symbol, decimals, type);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FiatCurrencyImplCopyWith<_$FiatCurrencyImpl> get copyWith =>
      __$$FiatCurrencyImplCopyWithImpl<_$FiatCurrencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrencyId id, String name, String slug,
            String symbol, int decimals, CurrencyType type)
        fiat,
    required TResult Function(CurrencyId id, String name, String slug,
            CurrencyType type, ChainId chainId)
        crypto,
  }) {
    return fiat(id, name, slug, symbol, decimals, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId id, String name, String slug, String symbol,
            int decimals, CurrencyType type)?
        fiat,
    TResult? Function(CurrencyId id, String name, String slug,
            CurrencyType type, ChainId chainId)?
        crypto,
  }) {
    return fiat?.call(id, name, slug, symbol, decimals, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId id, String name, String slug, String symbol,
            int decimals, CurrencyType type)?
        fiat,
    TResult Function(CurrencyId id, String name, String slug, CurrencyType type,
            ChainId chainId)?
        crypto,
    required TResult orElse(),
  }) {
    if (fiat != null) {
      return fiat(id, name, slug, symbol, decimals, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FiatCurrency value) fiat,
    required TResult Function(CryptoCurrency value) crypto,
  }) {
    return fiat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FiatCurrency value)? fiat,
    TResult? Function(CryptoCurrency value)? crypto,
  }) {
    return fiat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FiatCurrency value)? fiat,
    TResult Function(CryptoCurrency value)? crypto,
    required TResult orElse(),
  }) {
    if (fiat != null) {
      return fiat(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FiatCurrencyImplToJson(
      this,
    );
  }
}

abstract class FiatCurrency extends Currency {
  const factory FiatCurrency(
      {final CurrencyId id,
      final String name,
      final String slug,
      final String symbol,
      final int decimals,
      final CurrencyType type}) = _$FiatCurrencyImpl;
  const FiatCurrency._() : super._();

  factory FiatCurrency.fromJson(Map<String, dynamic> json) =
      _$FiatCurrencyImpl.fromJson;

  @override
  CurrencyId get id;
  @override
  String get name;
  @override
  String get slug;
  String get symbol;
  int get decimals;
  @override
  CurrencyType get type;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FiatCurrencyImplCopyWith<_$FiatCurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CryptoCurrencyImplCopyWith<$Res>
    implements $CurrencyCopyWith<$Res> {
  factory _$$CryptoCurrencyImplCopyWith(_$CryptoCurrencyImpl value,
          $Res Function(_$CryptoCurrencyImpl) then) =
      __$$CryptoCurrencyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyId id,
      String name,
      String slug,
      CurrencyType type,
      ChainId chainId});
}

/// @nodoc
class __$$CryptoCurrencyImplCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$CryptoCurrencyImpl>
    implements _$$CryptoCurrencyImplCopyWith<$Res> {
  __$$CryptoCurrencyImplCopyWithImpl(
      _$CryptoCurrencyImpl _value, $Res Function(_$CryptoCurrencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = null,
    Object? type = null,
    Object? chainId = null,
  }) {
    return _then(_$CryptoCurrencyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
      chainId: null == chainId
          ? _value.chainId
          : chainId // ignore: cast_nullable_to_non_nullable
              as ChainId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoCurrencyImpl extends CryptoCurrency {
  const _$CryptoCurrencyImpl(
      {this.id = CurrencyId.empty,
      this.name = '',
      this.slug = '',
      this.type = CurrencyType.crypto,
      this.chainId = ChainId.empty,
      final String? $type})
      : $type = $type ?? 'crypto',
        super._();

  factory _$CryptoCurrencyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoCurrencyImplFromJson(json);

  @override
  @JsonKey()
  final CurrencyId id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String slug;
  @override
  @JsonKey()
  final CurrencyType type;
  @override
  @JsonKey()
  final ChainId chainId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Currency.crypto(id: $id, name: $name, slug: $slug, type: $type, chainId: $chainId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoCurrencyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.chainId, chainId) || other.chainId == chainId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, type, chainId);

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoCurrencyImplCopyWith<_$CryptoCurrencyImpl> get copyWith =>
      __$$CryptoCurrencyImplCopyWithImpl<_$CryptoCurrencyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrencyId id, String name, String slug,
            String symbol, int decimals, CurrencyType type)
        fiat,
    required TResult Function(CurrencyId id, String name, String slug,
            CurrencyType type, ChainId chainId)
        crypto,
  }) {
    return crypto(id, name, slug, type, chainId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId id, String name, String slug, String symbol,
            int decimals, CurrencyType type)?
        fiat,
    TResult? Function(CurrencyId id, String name, String slug,
            CurrencyType type, ChainId chainId)?
        crypto,
  }) {
    return crypto?.call(id, name, slug, type, chainId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId id, String name, String slug, String symbol,
            int decimals, CurrencyType type)?
        fiat,
    TResult Function(CurrencyId id, String name, String slug, CurrencyType type,
            ChainId chainId)?
        crypto,
    required TResult orElse(),
  }) {
    if (crypto != null) {
      return crypto(id, name, slug, type, chainId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FiatCurrency value) fiat,
    required TResult Function(CryptoCurrency value) crypto,
  }) {
    return crypto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FiatCurrency value)? fiat,
    TResult? Function(CryptoCurrency value)? crypto,
  }) {
    return crypto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FiatCurrency value)? fiat,
    TResult Function(CryptoCurrency value)? crypto,
    required TResult orElse(),
  }) {
    if (crypto != null) {
      return crypto(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoCurrencyImplToJson(
      this,
    );
  }
}

abstract class CryptoCurrency extends Currency {
  const factory CryptoCurrency(
      {final CurrencyId id,
      final String name,
      final String slug,
      final CurrencyType type,
      final ChainId chainId}) = _$CryptoCurrencyImpl;
  const CryptoCurrency._() : super._();

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) =
      _$CryptoCurrencyImpl.fromJson;

  @override
  CurrencyId get id;
  @override
  String get name;
  @override
  String get slug;
  @override
  CurrencyType get type;
  ChainId get chainId;

  /// Create a copy of Currency
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CryptoCurrencyImplCopyWith<_$CryptoCurrencyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

/// @nodoc
mixin _$Budget {
  DateTime get date => throw _privateConstructorUsedError;
  BudgetId get id => throw _privateConstructorUsedError;
  InputMoney get input => throw _privateConstructorUsedError;

  /// Serializes this Budget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetCopyWith<Budget> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetCopyWith<$Res> {
  factory $BudgetCopyWith(Budget value, $Res Function(Budget) then) =
      _$BudgetCopyWithImpl<$Res, Budget>;
  @useResult
  $Res call({DateTime date, BudgetId id, InputMoney input});

  $InputMoneyCopyWith<$Res> get input;
}

/// @nodoc
class _$BudgetCopyWithImpl<$Res, $Val extends Budget>
    implements $BudgetCopyWith<$Res> {
  _$BudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? input = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetId,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as InputMoney,
    ) as $Val);
  }

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputMoneyCopyWith<$Res> get input {
    return $InputMoneyCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BudgetImplCopyWith<$Res> implements $BudgetCopyWith<$Res> {
  factory _$$BudgetImplCopyWith(
          _$BudgetImpl value, $Res Function(_$BudgetImpl) then) =
      __$$BudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, BudgetId id, InputMoney input});

  @override
  $InputMoneyCopyWith<$Res> get input;
}

/// @nodoc
class __$$BudgetImplCopyWithImpl<$Res>
    extends _$BudgetCopyWithImpl<$Res, _$BudgetImpl>
    implements _$$BudgetImplCopyWith<$Res> {
  __$$BudgetImplCopyWithImpl(
      _$BudgetImpl _value, $Res Function(_$BudgetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? id = null,
    Object? input = null,
  }) {
    return _then(_$BudgetImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BudgetId,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as InputMoney,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetImpl extends _Budget {
  const _$BudgetImpl(
      {required this.date,
      this.id = BudgetId.empty,
      this.input = InputMoney.empty})
      : super._();

  factory _$BudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey()
  final BudgetId id;
  @override
  @JsonKey()
  final InputMoney input;

  @override
  String toString() {
    return 'Budget(date: $date, id: $id, input: $input)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.input, input) || other.input == input));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, id, input);

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      __$$BudgetImplCopyWithImpl<_$BudgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetImplToJson(
      this,
    );
  }
}

abstract class _Budget extends Budget {
  const factory _Budget(
      {required final DateTime date,
      final BudgetId id,
      final InputMoney input}) = _$BudgetImpl;
  const _Budget._() : super._();

  factory _Budget.fromJson(Map<String, dynamic> json) = _$BudgetImpl.fromJson;

  @override
  DateTime get date;
  @override
  BudgetId get id;
  @override
  InputMoney get input;

  /// Create a copy of Budget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetImplCopyWith<_$BudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  DateTime get transactionDate => throw _privateConstructorUsedError;
  TransactionId get id => throw _privateConstructorUsedError;
  InputMoney get input => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get note =>
      throw _privateConstructorUsedError; // TODO(arenukvern): convert to list in future
  String get shoppingListString => throw _privateConstructorUsedError;
  TaskId get taskId => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  CategoryId get categoryId => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {DateTime transactionDate,
      TransactionId id,
      InputMoney input,
      String description,
      String note,
      String shoppingListString,
      TaskId taskId,
      TransactionType type,
      CategoryId categoryId});

  $InputMoneyCopyWith<$Res> get input;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? id = null,
    Object? input = null,
    Object? description = null,
    Object? note = null,
    Object? shoppingListString = null,
    Object? taskId = null,
    Object? type = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as InputMoney,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingListString: null == shoppingListString
          ? _value.shoppingListString
          : shoppingListString // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskId,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as CategoryId,
    ) as $Val);
  }

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputMoneyCopyWith<$Res> get input {
    return $InputMoneyCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime transactionDate,
      TransactionId id,
      InputMoney input,
      String description,
      String note,
      String shoppingListString,
      TaskId taskId,
      TransactionType type,
      CategoryId categoryId});

  @override
  $InputMoneyCopyWith<$Res> get input;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? id = null,
    Object? input = null,
    Object? description = null,
    Object? note = null,
    Object? shoppingListString = null,
    Object? taskId = null,
    Object? type = null,
    Object? categoryId = null,
  }) {
    return _then(_$TransactionImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TransactionId,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as InputMoney,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingListString: null == shoppingListString
          ? _value.shoppingListString
          : shoppingListString // ignore: cast_nullable_to_non_nullable
              as String,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as TaskId,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as CategoryId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl extends _Transaction {
  const _$TransactionImpl(
      {required this.transactionDate,
      this.id = TransactionId.empty,
      this.input = InputMoney.empty,
      this.description = '',
      this.note = '',
      this.shoppingListString = '',
      this.taskId = TaskId.empty,
      this.type = TransactionType.expense,
      this.categoryId = CategoryId.empty})
      : super._();

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final DateTime transactionDate;
  @override
  @JsonKey()
  final TransactionId id;
  @override
  @JsonKey()
  final InputMoney input;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String note;
// TODO(arenukvern): convert to list in future
  @override
  @JsonKey()
  final String shoppingListString;
  @override
  @JsonKey()
  final TaskId taskId;
  @override
  @JsonKey()
  final TransactionType type;
  @override
  @JsonKey()
  final CategoryId categoryId;

  @override
  String toString() {
    return 'Transaction(transactionDate: $transactionDate, id: $id, input: $input, description: $description, note: $note, shoppingListString: $shoppingListString, taskId: $taskId, type: $type, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.shoppingListString, shoppingListString) ||
                other.shoppingListString == shoppingListString) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactionDate, id, input,
      description, note, shoppingListString, taskId, type, categoryId);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
      {required final DateTime transactionDate,
      final TransactionId id,
      final InputMoney input,
      final String description,
      final String note,
      final String shoppingListString,
      final TaskId taskId,
      final TransactionType type,
      final CategoryId categoryId}) = _$TransactionImpl;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  DateTime get transactionDate;
  @override
  TransactionId get id;
  @override
  InputMoney get input;
  @override
  String get description;
  @override
  String get note; // TODO(arenukvern): convert to list in future
  @override
  String get shoppingListString;
  @override
  TaskId get taskId;
  @override
  TransactionType get type;
  @override
  CategoryId get categoryId;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InputMoney _$InputMoneyFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'fiat':
      return FiatInputModel.fromJson(json);
    case 'crypto':
      return CyptoInputModel.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'InputMoney',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$InputMoney {
  CurrencyId get currencyId => throw _privateConstructorUsedError;
  double get amountWithTax => throw _privateConstructorUsedError;
  CurrencyType get currencyType => throw _privateConstructorUsedError;
  TaxValue get tax => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)
        fiat,
    required TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)
        crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        fiat,
    TResult? Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        fiat,
    TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        crypto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FiatInputModel value) fiat,
    required TResult Function(CyptoInputModel value) crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FiatInputModel value)? fiat,
    TResult? Function(CyptoInputModel value)? crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FiatInputModel value)? fiat,
    TResult Function(CyptoInputModel value)? crypto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this InputMoney to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InputMoneyCopyWith<InputMoney> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputMoneyCopyWith<$Res> {
  factory $InputMoneyCopyWith(
          InputMoney value, $Res Function(InputMoney) then) =
      _$InputMoneyCopyWithImpl<$Res, InputMoney>;
  @useResult
  $Res call(
      {CurrencyId currencyId,
      double amountWithTax,
      CurrencyType currencyType,
      TaxValue tax});
}

/// @nodoc
class _$InputMoneyCopyWithImpl<$Res, $Val extends InputMoney>
    implements $InputMoneyCopyWith<$Res> {
  _$InputMoneyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyId = null,
    Object? amountWithTax = null,
    Object? currencyType = null,
    Object? tax = null,
  }) {
    return _then(_value.copyWith(
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      amountWithTax: null == amountWithTax
          ? _value.amountWithTax
          : amountWithTax // ignore: cast_nullable_to_non_nullable
              as double,
      currencyType: null == currencyType
          ? _value.currencyType
          : currencyType // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as TaxValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FiatInputModelImplCopyWith<$Res>
    implements $InputMoneyCopyWith<$Res> {
  factory _$$FiatInputModelImplCopyWith(_$FiatInputModelImpl value,
          $Res Function(_$FiatInputModelImpl) then) =
      __$$FiatInputModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyId currencyId,
      double amountWithTax,
      CurrencyType currencyType,
      TaxValue tax});
}

/// @nodoc
class __$$FiatInputModelImplCopyWithImpl<$Res>
    extends _$InputMoneyCopyWithImpl<$Res, _$FiatInputModelImpl>
    implements _$$FiatInputModelImplCopyWith<$Res> {
  __$$FiatInputModelImplCopyWithImpl(
      _$FiatInputModelImpl _value, $Res Function(_$FiatInputModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyId = null,
    Object? amountWithTax = null,
    Object? currencyType = null,
    Object? tax = null,
  }) {
    return _then(_$FiatInputModelImpl(
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      amountWithTax: null == amountWithTax
          ? _value.amountWithTax
          : amountWithTax // ignore: cast_nullable_to_non_nullable
              as double,
      currencyType: null == currencyType
          ? _value.currencyType
          : currencyType // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as TaxValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FiatInputModelImpl extends FiatInputModel {
  const _$FiatInputModelImpl(
      {this.currencyId = CurrencyId.empty,
      this.amountWithTax = 0.0,
      this.currencyType = CurrencyType.fiat,
      this.tax = TaxValue.zero,
      final String? $type})
      : $type = $type ?? 'fiat',
        super._();

  factory _$FiatInputModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FiatInputModelImplFromJson(json);

  @override
  @JsonKey()
  final CurrencyId currencyId;
  @override
  @JsonKey()
  final double amountWithTax;
  @override
  @JsonKey()
  final CurrencyType currencyType;
  @override
  @JsonKey()
  final TaxValue tax;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InputMoney.fiat(currencyId: $currencyId, amountWithTax: $amountWithTax, currencyType: $currencyType, tax: $tax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiatInputModelImpl &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.amountWithTax, amountWithTax) ||
                other.amountWithTax == amountWithTax) &&
            (identical(other.currencyType, currencyType) ||
                other.currencyType == currencyType) &&
            (identical(other.tax, tax) || other.tax == tax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currencyId, amountWithTax, currencyType, tax);

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FiatInputModelImplCopyWith<_$FiatInputModelImpl> get copyWith =>
      __$$FiatInputModelImplCopyWithImpl<_$FiatInputModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)
        fiat,
    required TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)
        crypto,
  }) {
    return fiat(currencyId, amountWithTax, currencyType, tax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        fiat,
    TResult? Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        crypto,
  }) {
    return fiat?.call(currencyId, amountWithTax, currencyType, tax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        fiat,
    TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        crypto,
    required TResult orElse(),
  }) {
    if (fiat != null) {
      return fiat(currencyId, amountWithTax, currencyType, tax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FiatInputModel value) fiat,
    required TResult Function(CyptoInputModel value) crypto,
  }) {
    return fiat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FiatInputModel value)? fiat,
    TResult? Function(CyptoInputModel value)? crypto,
  }) {
    return fiat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FiatInputModel value)? fiat,
    TResult Function(CyptoInputModel value)? crypto,
    required TResult orElse(),
  }) {
    if (fiat != null) {
      return fiat(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FiatInputModelImplToJson(
      this,
    );
  }
}

abstract class FiatInputModel extends InputMoney {
  const factory FiatInputModel(
      {final CurrencyId currencyId,
      final double amountWithTax,
      final CurrencyType currencyType,
      final TaxValue tax}) = _$FiatInputModelImpl;
  const FiatInputModel._() : super._();

  factory FiatInputModel.fromJson(Map<String, dynamic> json) =
      _$FiatInputModelImpl.fromJson;

  @override
  CurrencyId get currencyId;
  @override
  double get amountWithTax;
  @override
  CurrencyType get currencyType;
  @override
  TaxValue get tax;

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FiatInputModelImplCopyWith<_$FiatInputModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CyptoInputModelImplCopyWith<$Res>
    implements $InputMoneyCopyWith<$Res> {
  factory _$$CyptoInputModelImplCopyWith(_$CyptoInputModelImpl value,
          $Res Function(_$CyptoInputModelImpl) then) =
      __$$CyptoInputModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrencyId currencyId,
      double amountWithTax,
      CurrencyType currencyType,
      TaxValue tax});
}

/// @nodoc
class __$$CyptoInputModelImplCopyWithImpl<$Res>
    extends _$InputMoneyCopyWithImpl<$Res, _$CyptoInputModelImpl>
    implements _$$CyptoInputModelImplCopyWith<$Res> {
  __$$CyptoInputModelImplCopyWithImpl(
      _$CyptoInputModelImpl _value, $Res Function(_$CyptoInputModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currencyId = null,
    Object? amountWithTax = null,
    Object? currencyType = null,
    Object? tax = null,
  }) {
    return _then(_$CyptoInputModelImpl(
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      amountWithTax: null == amountWithTax
          ? _value.amountWithTax
          : amountWithTax // ignore: cast_nullable_to_non_nullable
              as double,
      currencyType: null == currencyType
          ? _value.currencyType
          : currencyType // ignore: cast_nullable_to_non_nullable
              as CurrencyType,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as TaxValue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CyptoInputModelImpl extends CyptoInputModel {
  const _$CyptoInputModelImpl(
      {this.currencyId = CurrencyId.empty,
      this.amountWithTax = 0.0,
      this.currencyType = CurrencyType.crypto,
      this.tax = TaxValue.zero,
      final String? $type})
      : $type = $type ?? 'crypto',
        super._();

  factory _$CyptoInputModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CyptoInputModelImplFromJson(json);

  @override
  @JsonKey()
  final CurrencyId currencyId;
  @override
  @JsonKey()
  final double amountWithTax;
  @override
  @JsonKey()
  final CurrencyType currencyType;
  @override
  @JsonKey()
  final TaxValue tax;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InputMoney.crypto(currencyId: $currencyId, amountWithTax: $amountWithTax, currencyType: $currencyType, tax: $tax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CyptoInputModelImpl &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.amountWithTax, amountWithTax) ||
                other.amountWithTax == amountWithTax) &&
            (identical(other.currencyType, currencyType) ||
                other.currencyType == currencyType) &&
            (identical(other.tax, tax) || other.tax == tax));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currencyId, amountWithTax, currencyType, tax);

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CyptoInputModelImplCopyWith<_$CyptoInputModelImpl> get copyWith =>
      __$$CyptoInputModelImplCopyWithImpl<_$CyptoInputModelImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)
        fiat,
    required TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)
        crypto,
  }) {
    return crypto(currencyId, amountWithTax, currencyType, tax);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        fiat,
    TResult? Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        crypto,
  }) {
    return crypto?.call(currencyId, amountWithTax, currencyType, tax);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        fiat,
    TResult Function(CurrencyId currencyId, double amountWithTax,
            CurrencyType currencyType, TaxValue tax)?
        crypto,
    required TResult orElse(),
  }) {
    if (crypto != null) {
      return crypto(currencyId, amountWithTax, currencyType, tax);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FiatInputModel value) fiat,
    required TResult Function(CyptoInputModel value) crypto,
  }) {
    return crypto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FiatInputModel value)? fiat,
    TResult? Function(CyptoInputModel value)? crypto,
  }) {
    return crypto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FiatInputModel value)? fiat,
    TResult Function(CyptoInputModel value)? crypto,
    required TResult orElse(),
  }) {
    if (crypto != null) {
      return crypto(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CyptoInputModelImplToJson(
      this,
    );
  }
}

abstract class CyptoInputModel extends InputMoney {
  const factory CyptoInputModel(
      {final CurrencyId currencyId,
      final double amountWithTax,
      final CurrencyType currencyType,
      final TaxValue tax}) = _$CyptoInputModelImpl;
  const CyptoInputModel._() : super._();

  factory CyptoInputModel.fromJson(Map<String, dynamic> json) =
      _$CyptoInputModelImpl.fromJson;

  @override
  CurrencyId get currencyId;
  @override
  double get amountWithTax;
  @override
  CurrencyType get currencyType;
  @override
  TaxValue get tax;

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CyptoInputModelImplCopyWith<_$CyptoInputModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserModelId {
  String get value => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) local,
    required TResult Function(String value) remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? local,
    TResult? Function(String value)? remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? local,
    TResult Function(String value)? remote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModelLocalId value) local,
    required TResult Function(UserModelRemoteId value) remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModelLocalId value)? local,
    TResult? Function(UserModelRemoteId value)? remote,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModelLocalId value)? local,
    TResult Function(UserModelRemoteId value)? remote,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelIdCopyWith<UserModelId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelIdCopyWith<$Res> {
  factory $UserModelIdCopyWith(
          UserModelId value, $Res Function(UserModelId) then) =
      _$UserModelIdCopyWithImpl<$Res, UserModelId>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$UserModelIdCopyWithImpl<$Res, $Val extends UserModelId>
    implements $UserModelIdCopyWith<$Res> {
  _$UserModelIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelLocalIdImplCopyWith<$Res>
    implements $UserModelIdCopyWith<$Res> {
  factory _$$UserModelLocalIdImplCopyWith(_$UserModelLocalIdImpl value,
          $Res Function(_$UserModelLocalIdImpl) then) =
      __$$UserModelLocalIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UserModelLocalIdImplCopyWithImpl<$Res>
    extends _$UserModelIdCopyWithImpl<$Res, _$UserModelLocalIdImpl>
    implements _$$UserModelLocalIdImplCopyWith<$Res> {
  __$$UserModelLocalIdImplCopyWithImpl(_$UserModelLocalIdImpl _value,
      $Res Function(_$UserModelLocalIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UserModelLocalIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserModelLocalIdImpl extends UserModelLocalId {
  const _$UserModelLocalIdImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'UserModelId.local(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelLocalIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelLocalIdImplCopyWith<_$UserModelLocalIdImpl> get copyWith =>
      __$$UserModelLocalIdImplCopyWithImpl<_$UserModelLocalIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) local,
    required TResult Function(String value) remote,
  }) {
    return local(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? local,
    TResult? Function(String value)? remote,
  }) {
    return local?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? local,
    TResult Function(String value)? remote,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModelLocalId value) local,
    required TResult Function(UserModelRemoteId value) remote,
  }) {
    return local(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModelLocalId value)? local,
    TResult? Function(UserModelRemoteId value)? remote,
  }) {
    return local?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModelLocalId value)? local,
    TResult Function(UserModelRemoteId value)? remote,
    required TResult orElse(),
  }) {
    if (local != null) {
      return local(this);
    }
    return orElse();
  }
}

abstract class UserModelLocalId extends UserModelId {
  const factory UserModelLocalId({required final String value}) =
      _$UserModelLocalIdImpl;
  const UserModelLocalId._() : super._();

  @override
  String get value;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelLocalIdImplCopyWith<_$UserModelLocalIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserModelRemoteIdImplCopyWith<$Res>
    implements $UserModelIdCopyWith<$Res> {
  factory _$$UserModelRemoteIdImplCopyWith(_$UserModelRemoteIdImpl value,
          $Res Function(_$UserModelRemoteIdImpl) then) =
      __$$UserModelRemoteIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$UserModelRemoteIdImplCopyWithImpl<$Res>
    extends _$UserModelIdCopyWithImpl<$Res, _$UserModelRemoteIdImpl>
    implements _$$UserModelRemoteIdImplCopyWith<$Res> {
  __$$UserModelRemoteIdImplCopyWithImpl(_$UserModelRemoteIdImpl _value,
      $Res Function(_$UserModelRemoteIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$UserModelRemoteIdImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserModelRemoteIdImpl extends UserModelRemoteId {
  const _$UserModelRemoteIdImpl({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'UserModelId.remote(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelRemoteIdImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelRemoteIdImplCopyWith<_$UserModelRemoteIdImpl> get copyWith =>
      __$$UserModelRemoteIdImplCopyWithImpl<_$UserModelRemoteIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) local,
    required TResult Function(String value) remote,
  }) {
    return remote(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? local,
    TResult? Function(String value)? remote,
  }) {
    return remote?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? local,
    TResult Function(String value)? remote,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserModelLocalId value) local,
    required TResult Function(UserModelRemoteId value) remote,
  }) {
    return remote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserModelLocalId value)? local,
    TResult? Function(UserModelRemoteId value)? remote,
  }) {
    return remote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserModelLocalId value)? local,
    TResult Function(UserModelRemoteId value)? remote,
    required TResult orElse(),
  }) {
    if (remote != null) {
      return remote(this);
    }
    return orElse();
  }
}

abstract class UserModelRemoteId extends UserModelId {
  const factory UserModelRemoteId({required final String value}) =
      _$UserModelRemoteIdImpl;
  const UserModelRemoteId._() : super._();

  @override
  String get value;

  /// Create a copy of UserModelId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelRemoteIdImplCopyWith<_$UserModelRemoteIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(
      fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
  UserModelLocalId get localId => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
  UserModelRemoteId get remoteId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      UserModelLocalId localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      UserModelRemoteId remoteId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? remoteId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as UserModelLocalId,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as UserModelRemoteId,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      UserModelLocalId localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      UserModelRemoteId remoteId,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localId = freezed,
    Object? remoteId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserModelImpl(
      localId: freezed == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as UserModelLocalId,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as UserModelRemoteId,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UserModelImpl extends _UserModel {
  const _$UserModelImpl(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      required this.localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      required this.remoteId,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey(
      fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
  final UserModelLocalId localId;
  @override
  @JsonKey(
      fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
  final UserModelRemoteId remoteId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserModel(localId: $localId, remoteId: $remoteId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            const DeepCollectionEquality().equals(other.localId, localId) &&
            const DeepCollectionEquality().equals(other.remoteId, remoteId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(localId),
      const DeepCollectionEquality().hash(remoteId),
      createdAt,
      updatedAt);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel extends UserModel {
  const factory _UserModel(
      {@JsonKey(
          fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
      required final UserModelLocalId localId,
      @JsonKey(
          fromJson: UserModelId.remoteFromJson,
          toJson: UserModelId.toStringJson)
      required final UserModelRemoteId remoteId,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserModelImpl;
  const _UserModel._() : super._();

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  @JsonKey(
      fromJson: UserModelId.localFromJson, toJson: UserModelId.toStringJson)
  UserModelLocalId get localId;
  @override
  @JsonKey(
      fromJson: UserModelId.remoteFromJson, toJson: UserModelId.toStringJson)
  UserModelRemoteId get remoteId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) {
  return _SubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionModel {
  int get paidDaysLeft => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionModelCopyWith<SubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionModelCopyWith<$Res> {
  factory $SubscriptionModelCopyWith(
          SubscriptionModel value, $Res Function(SubscriptionModel) then) =
      _$SubscriptionModelCopyWithImpl<$Res, SubscriptionModel>;
  @useResult
  $Res call({int paidDaysLeft, DateTime? updatedAt});
}

/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res, $Val extends SubscriptionModel>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidDaysLeft = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      paidDaysLeft: null == paidDaysLeft
          ? _value.paidDaysLeft
          : paidDaysLeft // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionModelImplCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$$SubscriptionModelImplCopyWith(_$SubscriptionModelImpl value,
          $Res Function(_$SubscriptionModelImpl) then) =
      __$$SubscriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int paidDaysLeft, DateTime? updatedAt});
}

/// @nodoc
class __$$SubscriptionModelImplCopyWithImpl<$Res>
    extends _$SubscriptionModelCopyWithImpl<$Res, _$SubscriptionModelImpl>
    implements _$$SubscriptionModelImplCopyWith<$Res> {
  __$$SubscriptionModelImplCopyWithImpl(_$SubscriptionModelImpl _value,
      $Res Function(_$SubscriptionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paidDaysLeft = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SubscriptionModelImpl(
      paidDaysLeft: null == paidDaysLeft
          ? _value.paidDaysLeft
          : paidDaysLeft // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SubscriptionModelImpl implements _SubscriptionModel {
  const _$SubscriptionModelImpl({this.paidDaysLeft = 0, this.updatedAt});

  factory _$SubscriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionModelImplFromJson(json);

  @override
  @JsonKey()
  final int paidDaysLeft;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SubscriptionModel(paidDaysLeft: $paidDaysLeft, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionModelImpl &&
            (identical(other.paidDaysLeft, paidDaysLeft) ||
                other.paidDaysLeft == paidDaysLeft) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paidDaysLeft, updatedAt);

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      __$$SubscriptionModelImplCopyWithImpl<_$SubscriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionModelImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionModel implements SubscriptionModel {
  const factory _SubscriptionModel(
      {final int paidDaysLeft,
      final DateTime? updatedAt}) = _$SubscriptionModelImpl;

  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$SubscriptionModelImpl.fromJson;

  @override
  int get paidDaysLeft;
  @override
  DateTime? get updatedAt;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPermissionsModel _$UserPermissionsModelFromJson(Map<String, dynamic> json) {
  return _UserPermissionsModel.fromJson(json);
}

/// @nodoc
mixin _$UserPermissionsModel {
  bool get shouldBeSynced => throw _privateConstructorUsedError;
  int get tagLimit => throw _privateConstructorUsedError;

  /// Serializes this UserPermissionsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPermissionsModelCopyWith<UserPermissionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPermissionsModelCopyWith<$Res> {
  factory $UserPermissionsModelCopyWith(UserPermissionsModel value,
          $Res Function(UserPermissionsModel) then) =
      _$UserPermissionsModelCopyWithImpl<$Res, UserPermissionsModel>;
  @useResult
  $Res call({bool shouldBeSynced, int tagLimit});
}

/// @nodoc
class _$UserPermissionsModelCopyWithImpl<$Res,
        $Val extends UserPermissionsModel>
    implements $UserPermissionsModelCopyWith<$Res> {
  _$UserPermissionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldBeSynced = null,
    Object? tagLimit = null,
  }) {
    return _then(_value.copyWith(
      shouldBeSynced: null == shouldBeSynced
          ? _value.shouldBeSynced
          : shouldBeSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      tagLimit: null == tagLimit
          ? _value.tagLimit
          : tagLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPermissionsModelImplCopyWith<$Res>
    implements $UserPermissionsModelCopyWith<$Res> {
  factory _$$UserPermissionsModelImplCopyWith(_$UserPermissionsModelImpl value,
          $Res Function(_$UserPermissionsModelImpl) then) =
      __$$UserPermissionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool shouldBeSynced, int tagLimit});
}

/// @nodoc
class __$$UserPermissionsModelImplCopyWithImpl<$Res>
    extends _$UserPermissionsModelCopyWithImpl<$Res, _$UserPermissionsModelImpl>
    implements _$$UserPermissionsModelImplCopyWith<$Res> {
  __$$UserPermissionsModelImplCopyWithImpl(_$UserPermissionsModelImpl _value,
      $Res Function(_$UserPermissionsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shouldBeSynced = null,
    Object? tagLimit = null,
  }) {
    return _then(_$UserPermissionsModelImpl(
      shouldBeSynced: null == shouldBeSynced
          ? _value.shouldBeSynced
          : shouldBeSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      tagLimit: null == tagLimit
          ? _value.tagLimit
          : tagLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UserPermissionsModelImpl implements _UserPermissionsModel {
  const _$UserPermissionsModelImpl(
      {this.shouldBeSynced = false, this.tagLimit = 5});

  factory _$UserPermissionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPermissionsModelImplFromJson(json);

  @override
  @JsonKey()
  final bool shouldBeSynced;
  @override
  @JsonKey()
  final int tagLimit;

  @override
  String toString() {
    return 'UserPermissionsModel(shouldBeSynced: $shouldBeSynced, tagLimit: $tagLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPermissionsModelImpl &&
            (identical(other.shouldBeSynced, shouldBeSynced) ||
                other.shouldBeSynced == shouldBeSynced) &&
            (identical(other.tagLimit, tagLimit) ||
                other.tagLimit == tagLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shouldBeSynced, tagLimit);

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPermissionsModelImplCopyWith<_$UserPermissionsModelImpl>
      get copyWith =>
          __$$UserPermissionsModelImplCopyWithImpl<_$UserPermissionsModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPermissionsModelImplToJson(
      this,
    );
  }
}

abstract class _UserPermissionsModel implements UserPermissionsModel {
  const factory _UserPermissionsModel(
      {final bool shouldBeSynced,
      final int tagLimit}) = _$UserPermissionsModelImpl;

  factory _UserPermissionsModel.fromJson(Map<String, dynamic> json) =
      _$UserPermissionsModelImpl.fromJson;

  @override
  bool get shouldBeSynced;
  @override
  int get tagLimit;

  /// Create a copy of UserPermissionsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPermissionsModelImplCopyWith<_$UserPermissionsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

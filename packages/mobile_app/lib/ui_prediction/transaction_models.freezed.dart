// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  DateTime get date => throw _privateConstructorUsedError;
  TransactionId get id => throw _privateConstructorUsedError;
  InputMoney get input => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  TransactionSchedule get schedule => throw _privateConstructorUsedError;
  TransactionCategoryId get categoryId => throw _privateConstructorUsedError;

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
      {DateTime date,
      TransactionId id,
      InputMoney input,
      String description,
      TransactionType type,
      TransactionSchedule schedule,
      TransactionCategoryId categoryId});

  $InputMoneyCopyWith<$Res> get input;
  $TransactionScheduleCopyWith<$Res> get schedule;
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
    Object? date = null,
    Object? id = null,
    Object? input = null,
    Object? description = null,
    Object? type = null,
    Object? schedule = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as TransactionSchedule,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as TransactionCategoryId,
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

  /// Create a copy of Transaction
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
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      TransactionId id,
      InputMoney input,
      String description,
      TransactionType type,
      TransactionSchedule schedule,
      TransactionCategoryId categoryId});

  @override
  $InputMoneyCopyWith<$Res> get input;
  @override
  $TransactionScheduleCopyWith<$Res> get schedule;
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
    Object? date = null,
    Object? id = null,
    Object? input = null,
    Object? description = null,
    Object? type = null,
    Object? schedule = null,
    Object? categoryId = null,
  }) {
    return _then(_$TransactionImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as TransactionSchedule,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as TransactionCategoryId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl extends _Transaction {
  const _$TransactionImpl(
      {required this.date,
      this.id = TransactionId.empty,
      this.input = InputMoney.empty,
      this.description = '',
      this.type = TransactionType.expense,
      this.schedule = TransactionSchedule.empty,
      this.categoryId = TransactionCategoryId.empty})
      : super._();

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final DateTime date;
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
  final TransactionType type;
  @override
  @JsonKey()
  final TransactionSchedule schedule;
  @override
  @JsonKey()
  final TransactionCategoryId categoryId;

  @override
  String toString() {
    return 'Transaction(date: $date, id: $id, input: $input, description: $description, type: $type, schedule: $schedule, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, id, input, description, type, schedule, categoryId);

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
      {required final DateTime date,
      final TransactionId id,
      final InputMoney input,
      final String description,
      final TransactionType type,
      final TransactionSchedule schedule,
      final TransactionCategoryId categoryId}) = _$TransactionImpl;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  DateTime get date;
  @override
  TransactionId get id;
  @override
  InputMoney get input;
  @override
  String get description;
  @override
  TransactionType get type;
  @override
  TransactionSchedule get schedule;
  @override
  TransactionCategoryId get categoryId;

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
  double get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CurrencyId currencyId, double amount) fiat,
    required TResult Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)
        crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId currencyId, double amount)? fiat,
    TResult? Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)?
        crypto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId currencyId, double amount)? fiat,
    TResult Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)?
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
  $Res call({CurrencyId currencyId, double amount});
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
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
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
  $Res call({CurrencyId currencyId, double amount});
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
    Object? amount = null,
  }) {
    return _then(_$FiatInputModelImpl(
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FiatInputModelImpl extends FiatInputModel {
  const _$FiatInputModelImpl(
      {this.currencyId = CurrencyId.empty,
      this.amount = 0.0,
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
  final double amount;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InputMoney.fiat(currencyId: $currencyId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FiatInputModelImpl &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currencyId, amount);

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
    required TResult Function(CurrencyId currencyId, double amount) fiat,
    required TResult Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)
        crypto,
  }) {
    return fiat(currencyId, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId currencyId, double amount)? fiat,
    TResult? Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)?
        crypto,
  }) {
    return fiat?.call(currencyId, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId currencyId, double amount)? fiat,
    TResult Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)?
        crypto,
    required TResult orElse(),
  }) {
    if (fiat != null) {
      return fiat(currencyId, amount);
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
      final double amount}) = _$FiatInputModelImpl;
  const FiatInputModel._() : super._();

  factory FiatInputModel.fromJson(Map<String, dynamic> json) =
      _$FiatInputModelImpl.fromJson;

  @override
  CurrencyId get currencyId;
  @override
  double get amount;

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
      double amount,
      BlockchainNetworkId blockchainNetworkId});
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
    Object? amount = null,
    Object? blockchainNetworkId = null,
  }) {
    return _then(_$CyptoInputModelImpl(
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as CurrencyId,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      blockchainNetworkId: null == blockchainNetworkId
          ? _value.blockchainNetworkId
          : blockchainNetworkId // ignore: cast_nullable_to_non_nullable
              as BlockchainNetworkId,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CyptoInputModelImpl extends CyptoInputModel {
  const _$CyptoInputModelImpl(
      {this.currencyId = CurrencyId.empty,
      this.amount = 0.0,
      this.blockchainNetworkId = BlockchainNetworkId.empty,
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
  final double amount;
  @override
  @JsonKey()
  final BlockchainNetworkId blockchainNetworkId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InputMoney.crypto(currencyId: $currencyId, amount: $amount, blockchainNetworkId: $blockchainNetworkId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CyptoInputModelImpl &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.blockchainNetworkId, blockchainNetworkId) ||
                other.blockchainNetworkId == blockchainNetworkId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currencyId, amount, blockchainNetworkId);

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
    required TResult Function(CurrencyId currencyId, double amount) fiat,
    required TResult Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)
        crypto,
  }) {
    return crypto(currencyId, amount, blockchainNetworkId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CurrencyId currencyId, double amount)? fiat,
    TResult? Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)?
        crypto,
  }) {
    return crypto?.call(currencyId, amount, blockchainNetworkId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CurrencyId currencyId, double amount)? fiat,
    TResult Function(CurrencyId currencyId, double amount,
            BlockchainNetworkId blockchainNetworkId)?
        crypto,
    required TResult orElse(),
  }) {
    if (crypto != null) {
      return crypto(currencyId, amount, blockchainNetworkId);
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
      final double amount,
      final BlockchainNetworkId blockchainNetworkId}) = _$CyptoInputModelImpl;
  const CyptoInputModel._() : super._();

  factory CyptoInputModel.fromJson(Map<String, dynamic> json) =
      _$CyptoInputModelImpl.fromJson;

  @override
  CurrencyId get currencyId;
  @override
  double get amount;
  BlockchainNetworkId get blockchainNetworkId;

  /// Create a copy of InputMoney
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CyptoInputModelImplCopyWith<_$CyptoInputModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
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

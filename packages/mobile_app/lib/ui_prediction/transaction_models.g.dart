// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      date: DateTime.parse(json['date'] as String),
      id: json['id'] == null
          ? BudgetId.empty
          : BudgetId.fromJson(json['id'] as String),
      input: json['input'] == null
          ? InputMoney.empty
          : InputMoney.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'input': instance.input,
    };

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      date: DateTime.parse(json['date'] as String),
      id: json['id'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['id'] as String),
      input: json['input'] == null
          ? InputMoney.empty
          : InputMoney.fromJson(json['input'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
          TransactionType.expense,
      schedule: json['schedule'] == null
          ? TransactionSchedule.empty
          : TransactionSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
      categoryId: json['categoryId'] == null
          ? TransactionCategoryId.empty
          : TransactionCategoryId.fromJson(json['categoryId'] as String),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'id': instance.id,
      'input': instance.input,
      'description': instance.description,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'schedule': instance.schedule,
      'categoryId': instance.categoryId,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.expense: 'expense',
  TransactionType.income: 'income',
  TransactionType.transferIn: 'transfer_in',
  TransactionType.transferOut: 'transfer_out',
};

_$FiatInputModelImpl _$$FiatInputModelImplFromJson(Map<String, dynamic> json) =>
    _$FiatInputModelImpl(
      currencyId: json['currencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['currencyId'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      currencyType: json['currencyType'] == null
          ? CurrencyType.fiat
          : CurrencyType.fromJson(json['currencyType'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FiatInputModelImplToJson(
        _$FiatInputModelImpl instance) =>
    <String, dynamic>{
      'currencyId': instance.currencyId,
      'amount': instance.amount,
      'currencyType': instance.currencyType,
      'runtimeType': instance.$type,
    };

_$CyptoInputModelImpl _$$CyptoInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CyptoInputModelImpl(
      currencyId: json['currencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['currencyId'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
      blockchainNetworkId: json['blockchainNetworkId'] == null
          ? BlockchainNetworkId.empty
          : BlockchainNetworkId.fromJson(json['blockchainNetworkId'] as String),
      currencyType: json['currencyType'] == null
          ? CurrencyType.crypto
          : CurrencyType.fromJson(json['currencyType'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CyptoInputModelImplToJson(
        _$CyptoInputModelImpl instance) =>
    <String, dynamic>{
      'currencyId': instance.currencyId,
      'amount': instance.amount,
      'blockchainNetworkId': instance.blockchainNetworkId,
      'currencyType': instance.currencyType,
      'runtimeType': instance.$type,
    };

_$TransactionScheduleImpl _$$TransactionScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionScheduleImpl(
      periodType: $enumDecodeNullable(
              _$TransactionPeriodTypeEnumMap, json['periodType']) ??
          TransactionPeriodType.none,
      period:
          $enumDecodeNullable(_$PeriodEnumMap, json['period']) ?? Period.daily,
      dayOfMonth: (json['dayOfMonth'] as num?)?.toInt() ?? 0,
      dayOfWeek: (json['dayOfWeek'] as num?)?.toInt() ?? 0,
      dayOfQuarter: (json['dayOfQuarter'] as num?)?.toInt() ?? 0,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$TransactionScheduleImplToJson(
        _$TransactionScheduleImpl instance) =>
    <String, dynamic>{
      'periodType': _$TransactionPeriodTypeEnumMap[instance.periodType]!,
      'period': _$PeriodEnumMap[instance.period]!,
      'dayOfMonth': instance.dayOfMonth,
      'dayOfWeek': instance.dayOfWeek,
      'dayOfQuarter': instance.dayOfQuarter,
      'date': instance.date?.toIso8601String(),
    };

const _$TransactionPeriodTypeEnumMap = {
  TransactionPeriodType.none: 'none',
  TransactionPeriodType.bySpecificDate: 'bySpecificDate',
  TransactionPeriodType.byDayOfWeek: 'byDayOfWeek',
  TransactionPeriodType.byComputedDate: 'byComputedDate',
};

const _$PeriodEnumMap = {
  Period.daily: 'daily',
  Period.weekly: 'weekly',
  Period.monthly: 'monthly',
  Period.yearly: 'yearly',
};

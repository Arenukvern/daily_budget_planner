// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsModelImpl _$$AppSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsModelImpl(
      locale: localeFromString(json['locale'] as String?),
      brightness: json['brightness'] == null
          ? UiBrightness.system
          : UiBrightness.fromJson(json['brightness'] as String),
      use24HourFormat: json['use24HourFormat'] as bool? ?? true,
    );

Map<String, dynamic> _$$AppSettingsModelImplToJson(
        _$AppSettingsModelImpl instance) =>
    <String, dynamic>{
      'locale': localeToString(instance.locale),
      'brightness': UiBrightness.toJson(instance.brightness),
      'use24HourFormat': instance.use24HourFormat,
    };

_$MonthlyBudgetModelImpl _$$MonthlyBudgetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyBudgetModelImpl(
      id: BudgetModelId.fromJson(json['id'] as String),
      nextBudgetDay: dateTimeFromMilisecondsSinceEpoch(
          (json['nextBudgetDay'] as num?)?.toInt()),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      savings: (json['savings'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$MonthlyBudgetModelImplToJson(
        _$MonthlyBudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nextBudgetDay': dateTimeToMilisecondsSinceEpoch(instance.nextBudgetDay),
      'amount': instance.amount,
      'savings': instance.savings,
    };

_$WeeklyBudgetModelImpl _$$WeeklyBudgetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyBudgetModelImpl(
      id: BudgetModelId.fromJson(json['id'] as String),
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$WeeklyBudgetModelImplToJson(
        _$WeeklyBudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
    };

_$FinSettingsModelImpl _$$FinSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FinSettingsModelImpl(
      fiatCurrencyId: json['fiatCurrencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['fiatCurrencyId'] as String),
      cryptoCurrencyId: json['cryptoCurrencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['cryptoCurrencyId'] as String),
    );

Map<String, dynamic> _$$FinSettingsModelImplToJson(
        _$FinSettingsModelImpl instance) =>
    <String, dynamic>{
      'fiatCurrencyId': instance.fiatCurrencyId,
      'cryptoCurrencyId': instance.cryptoCurrencyId,
    };

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] == null
          ? TaskId.empty
          : TaskId.fromJson(json['id'] as String),
      status: json['status'] == null
          ? TaskStatus.visible
          : TaskStatus.fromJson(json['status'] as String),
      title: json['title'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      type: $enumDecodeNullable(_$TaskTypeEnumMap, json['type']) ??
          TaskType.personal,
      personalIncomeType: $enumDecodeNullable(
              _$PersonalIncomeTaskTypeEnumMap, json['personalIncomeType']) ??
          PersonalIncomeTaskType.salary,
      personalExpenseType: $enumDecodeNullable(
              _$PersonalExpenseTaskTypeEnumMap, json['personalExpenseType']) ??
          PersonalExpenseTaskType.other,
      transactionType: json['transactionType'] == null
          ? TaskTransactionType.income
          : TaskTransactionType.fromJson(json['transactionType'] as String),
      categoryIds: (json['categoryIds'] as List<dynamic>?)
              ?.map((e) => CategoryId.fromJson(e as String))
              .toList() ??
          const [],
      schedules: (json['schedules'] as List<dynamic>?)
              ?.map((e) =>
                  ScheduledTransaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'notes': instance.notes,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'personalIncomeType':
          _$PersonalIncomeTaskTypeEnumMap[instance.personalIncomeType]!,
      'personalExpenseType':
          _$PersonalExpenseTaskTypeEnumMap[instance.personalExpenseType]!,
      'transactionType': instance.transactionType,
      'categoryIds': instance.categoryIds,
      'schedules': instance.schedules,
    };

const _$TaskTypeEnumMap = {
  TaskType.personal: 'personal',
  TaskType.business: 'business',
};

const _$PersonalIncomeTaskTypeEnumMap = {
  PersonalIncomeTaskType.salary: 'salary',
  PersonalIncomeTaskType.cashback: 'cashback',
  PersonalIncomeTaskType.other: 'other',
  PersonalIncomeTaskType.investments: 'investments',
  PersonalIncomeTaskType.crypto: 'crypto',
};

const _$PersonalExpenseTaskTypeEnumMap = {
  PersonalExpenseTaskType.housing: 'housing',
  PersonalExpenseTaskType.subscriptions: 'subscriptions',
  PersonalExpenseTaskType.food: 'food',
  PersonalExpenseTaskType.transport: 'transport',
  PersonalExpenseTaskType.familyAndFriends: 'familyAndFriends',
  PersonalExpenseTaskType.entertainment: 'entertainment',
  PersonalExpenseTaskType.other: 'other',
};

_$ScheduledTransactionImpl _$$ScheduledTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$ScheduledTransactionImpl(
      transactionId: json['transactionId'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['transactionId'] as String),
      schedule: json['schedule'] == null
          ? TransactionSchedule.empty
          : TransactionSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ScheduledTransactionImplToJson(
        _$ScheduledTransactionImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'schedule': instance.schedule,
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

_$FiatCurrencyImpl _$$FiatCurrencyImplFromJson(Map<String, dynamic> json) =>
    _$FiatCurrencyImpl(
      id: json['id'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['id'] as String),
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      decimals: (json['decimals'] as num?)?.toInt() ?? 2,
      type: json['type'] == null
          ? CurrencyType.fiat
          : CurrencyType.fromJson(json['type'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FiatCurrencyImplToJson(_$FiatCurrencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
      'type': instance.type,
      'runtimeType': instance.$type,
    };

_$CryptoCurrencyImpl _$$CryptoCurrencyImplFromJson(Map<String, dynamic> json) =>
    _$CryptoCurrencyImpl(
      id: json['id'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['id'] as String),
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      type: json['type'] == null
          ? CurrencyType.crypto
          : CurrencyType.fromJson(json['type'] as String),
      chainId: json['chainId'] == null
          ? ChainId.empty
          : ChainId.fromJson(json['chainId'] as String),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CryptoCurrencyImplToJson(
        _$CryptoCurrencyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'type': instance.type,
      'chainId': instance.chainId,
      'runtimeType': instance.$type,
    };

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
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      id: json['id'] == null
          ? TransactionId.empty
          : TransactionId.fromJson(json['id'] as String),
      input: json['input'] == null
          ? InputMoney.empty
          : InputMoney.fromJson(json['input'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      note: json['note'] as String? ?? '',
      shoppingListString: json['shoppingListString'] as String? ?? '',
      taskId: json['taskId'] == null
          ? TaskId.empty
          : TaskId.fromJson(json['taskId'] as String),
      type: $enumDecodeNullable(_$TransactionTypeEnumMap, json['type']) ??
          TransactionType.expense,
      categoryId: json['categoryId'] == null
          ? CategoryId.empty
          : CategoryId.fromJson(json['categoryId'] as String),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'transactionDate': instance.transactionDate.toIso8601String(),
      'id': instance.id,
      'input': instance.input,
      'description': instance.description,
      'note': instance.note,
      'shoppingListString': instance.shoppingListString,
      'taskId': instance.taskId,
      'type': _$TransactionTypeEnumMap[instance.type]!,
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
      amountWithTax: (json['amountWithTax'] as num?)?.toDouble() ?? 0.0,
      currencyType: json['currencyType'] == null
          ? CurrencyType.fiat
          : CurrencyType.fromJson(json['currencyType'] as String),
      tax: json['tax'] == null
          ? TaxValue.zero
          : TaxValue.fromJson((json['tax'] as num).toInt()),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FiatInputModelImplToJson(
        _$FiatInputModelImpl instance) =>
    <String, dynamic>{
      'currencyId': instance.currencyId,
      'amountWithTax': instance.amountWithTax,
      'currencyType': instance.currencyType,
      'tax': instance.tax,
      'runtimeType': instance.$type,
    };

_$CyptoInputModelImpl _$$CyptoInputModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CyptoInputModelImpl(
      currencyId: json['currencyId'] == null
          ? CurrencyId.empty
          : CurrencyId.fromJson(json['currencyId'] as String),
      amountWithTax: (json['amountWithTax'] as num?)?.toDouble() ?? 0.0,
      currencyType: json['currencyType'] == null
          ? CurrencyType.crypto
          : CurrencyType.fromJson(json['currencyType'] as String),
      tax: json['tax'] == null
          ? TaxValue.zero
          : TaxValue.fromJson((json['tax'] as num).toInt()),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CyptoInputModelImplToJson(
        _$CyptoInputModelImpl instance) =>
    <String, dynamic>{
      'currencyId': instance.currencyId,
      'amountWithTax': instance.amountWithTax,
      'currencyType': instance.currencyType,
      'tax': instance.tax,
      'runtimeType': instance.$type,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      localId: UserModelId.localFromJson(json['local_id'] as String),
      remoteId: UserModelId.remoteFromJson(json['remote_id'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'local_id': UserModelId.toStringJson(instance.localId),
      'remote_id': UserModelId.toStringJson(instance.remoteId),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$SubscriptionModelImpl _$$SubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionModelImpl(
      paidDaysLeft: (json['paid_days_left'] as num?)?.toInt() ?? 0,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$SubscriptionModelImplToJson(
        _$SubscriptionModelImpl instance) =>
    <String, dynamic>{
      'paid_days_left': instance.paidDaysLeft,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_$UserPermissionsModelImpl _$$UserPermissionsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPermissionsModelImpl(
      shouldBeSynced: json['should_be_synced'] as bool? ?? false,
      tagLimit: (json['tag_limit'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$UserPermissionsModelImplToJson(
        _$UserPermissionsModelImpl instance) =>
    <String, dynamic>{
      'should_be_synced': instance.shouldBeSynced,
      'tag_limit': instance.tagLimit,
    };

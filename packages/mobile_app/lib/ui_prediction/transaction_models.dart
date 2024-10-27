import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/core/core.dart';

part 'transaction_models.freezed.dart';
part 'transaction_models.g.dart';

enum Period { daily, weekly, monthly, yearly }

enum PredictionType { positive, negative, neutral }

extension type const BudgetId(String value) {
  factory BudgetId.fromJson(final String value) => BudgetId(value);
  static const empty = BudgetId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

enum TransactionType {
  @JsonValue('expense')
  expense,
  @JsonValue('income')
  income,
  @JsonValue('transfer_in')
  transferIn,
  @JsonValue('transfer_out')
  transferOut,
}

extension type const TransactionId(String value) {
  factory TransactionId.fromJson(final String value) => TransactionId(value);
  factory TransactionId.newId() => TransactionId(createId());
  static const empty = TransactionId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

extension type const TransactionCategoryId(String value) {
  factory TransactionCategoryId.fromJson(final String value) =>
      TransactionCategoryId(value);
  static const empty = TransactionCategoryId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

enum TransactionPeriodType {
  /// no period
  none,

  /// every 25th day of the month
  bySpecificDate,

  /// every week on monday, everyday
  ///
  /// take inspiration from clock.
  byDayOfWeek,

  /// every 3th working day of the end of the month
  /// or every 3th working day of the quarter
  byComputedDate,
}

extension type const IncomeCategoryId(String value) {
  factory IncomeCategoryId.fromJson(final String value) =>
      IncomeCategoryId(value);
  static const empty = IncomeCategoryId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

enum CurrencyType {
  @JsonValue('fiat')
  fiat,
  @JsonValue('crypto')
  crypto;

  factory CurrencyType.fromJson(final String value) =>
      CurrencyType.values.byName(value);
  String toJson() => name;
}

/// any id, doesn't matter fiat or crypto
extension type const CurrencyId(String value) {
  factory CurrencyId.fromJson(final String value) => CurrencyId(value);
  static const empty = CurrencyId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

extension type const BlockchainNetworkId(String value) {
  factory BlockchainNetworkId.fromJson(final String value) =>
      BlockchainNetworkId(value);
  static const empty = BlockchainNetworkId('');
  bool get isEmpty => value.isEmpty;
  String toJson() => value;
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    required final DateTime date,
    @Default(BudgetId.empty) final BudgetId id,
    @Default(InputMoney.empty) final InputMoney input,
  }) = _Budget;
  const Budget._();
  factory Budget.fromJson(final Map<String, dynamic> json) =>
      _$BudgetFromJson(json);

  static final empty = Budget(date: DateTime.now());
  double get amount => input.amount;
  CurrencyId get currencyId => input.currencyId;
}

@freezed
sealed class Transaction with _$Transaction {
  /// Base transaction interface with common properties
  const factory Transaction({
    required final DateTime transactionDate,
    @Default(TransactionId.empty) final TransactionId id,
    @Default(InputMoney.empty) final InputMoney input,
    @Default('') final String description,
    @Default('') final String note,
    // TODO(arenukvern): convert to list in future
    @Default('') final String shoppingListString,
    @Default(TransactionType.expense) final TransactionType type,
    @Default(TransactionSchedule.empty) final TransactionSchedule schedule,
    @Default(TransactionCategoryId.empty)
    final TransactionCategoryId categoryId,
  }) = _Transaction;

  const Transaction._();

  factory Transaction.fromJson(final Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  static final empty = Transaction(transactionDate: DateTime.now());
  bool get isExpense => type == TransactionType.expense;
  bool get isIncome => type == TransactionType.income;
  bool get isRegular => schedule.isSet;
  double get amount => input.amount;
  CurrencyId get currencyId => input.currencyId;
}

/// Represents a monetary value in a specific fiat or crypto currency
@freezed
class InputMoney with _$InputMoney {
  const factory InputMoney.fiat({
    @Default(CurrencyId.empty) final CurrencyId currencyId,
    @Default(0.0) final double amount,
    @Default(CurrencyType.fiat) final CurrencyType currencyType,
  }) = FiatInputModel;
  const factory InputMoney.crypto({
    @Default(CurrencyId.empty) final CurrencyId currencyId,
    @Default(0.0) final double amount,
    @Default(BlockchainNetworkId.empty)
    final BlockchainNetworkId blockchainNetworkId,
    @Default(CurrencyType.crypto) final CurrencyType currencyType,
  }) = CyptoInputModel;

  const InputMoney._();
  factory InputMoney.fromJson(final Map<String, dynamic> json) =>
      _$InputMoneyFromJson(json);

  static const empty = FiatInputModel();
}

/// Represents a monetary value in a specific fiat or crypto currency
@freezed
class TransactionSchedule with _$TransactionSchedule {
  const factory TransactionSchedule({
    @Default(TransactionPeriodType.none) final TransactionPeriodType periodType,
    @Default(Period.daily) final Period period,
    @Default(0) final int dayOfMonth,
    @Default(0) final int dayOfWeek,
    @Default(0) final int dayOfQuarter,
    final DateTime? date,
  }) = _TransactionSchedule;

  const TransactionSchedule._();
  factory TransactionSchedule.fromJson(final Map<String, dynamic> json) =>
      _$TransactionScheduleFromJson(json);

  static const empty = TransactionSchedule();
  bool get isSet => periodType == TransactionPeriodType.none;
  bool get isNotSet => !isSet;
}

part of 'data_models.dart';

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

extension type const CategoryId(String value) {
  factory CategoryId.fromJson(final String value) => CategoryId(value);
  static const empty = CategoryId('');
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

@freezed
class Currency with _$Currency {
  const factory Currency.fiat({
    @Default(CurrencyId.empty) final CurrencyId id,
    @Default('') final String name,
    @Default('') final String slug,
    @Default('') final String symbol,
    @Default(2) final int decimals,
    @Default(CurrencyType.fiat) final CurrencyType type,
  }) = FiatCurrency;
  const factory Currency.crypto({
    @Default(CurrencyId.empty) final CurrencyId id,
    @Default('') final String name,
    @Default('') final String slug,
    @Default(CurrencyType.crypto) final CurrencyType type,
    @Default(ChainId.empty) final ChainId chainId,
  }) = CryptoCurrency;
  const Currency._();
  factory Currency.fromJson(final Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  String get displayString => switch (this) {
        FiatCurrency(:final symbol, :final slug, :final name) =>
          '$symbol ${slug.toUpperCase()} ($name)',
        CryptoCurrency(:final slug) ||
        Currency(:final slug) =>
          slug.toUpperCase(),
      };
}

extension type const ChainId(String value) {
  factory ChainId.fromJson(final String value) => ChainId(value);
  static const empty = ChainId('');
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
    @Default(TaskId.empty) final TaskId taskId,
    @Default(TransactionType.expense) final TransactionType type,
    @Default(CategoryId.empty) final CategoryId categoryId,
  }) = _Transaction;

  const Transaction._();

  factory Transaction.fromJson(final Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  static final empty = Transaction(transactionDate: DateTime.now());
  bool get isExpense => type == TransactionType.expense;
  bool get isIncome => type == TransactionType.income;
  bool get isRegular => taskId.isNotEmpty;
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
    @Default(CurrencyType.crypto) final CurrencyType currencyType,
  }) = CyptoInputModel;

  const InputMoney._();
  factory InputMoney.fromJson(final Map<String, dynamic> json) =>
      _$InputMoneyFromJson(json);

  static const empty = FiatInputModel();
}

extension TransactionListX on List<Transaction> {
  double sumForPeriod(final Period period) {
    final now = DateTime.now();
    final diff = now.difference;
    return fold(
      0,
      (final previousValue, final e) {
        final bool isWithinPeriod = switch (period) {
          // TODO(arenukvern): calculate average amount per day
          Period.daily => diff(e.transactionDate).inDays <= 1,
          Period.weekly => diff(e.transactionDate).inDays <= 7,
          Period.monthly => diff(e.transactionDate).inDays <= 30,
          Period.yearly => diff(e.transactionDate).inDays <= 365,
        };
        return isWithinPeriod ? previousValue + e.amount : previousValue;
      },
    );
  }
}

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
  transferOut;

  TaskTransactionType? toTaskTransactionType() => switch (this) {
        expense => TaskTransactionType.expense,
        income => TaskTransactionType.income,

        /// transfers should not have task id
        transferIn || transferOut => null,
      };
}

extension type const TransactionId(String value) {
  factory TransactionId.fromJson(final String value) => TransactionId(value);
  factory TransactionId.newId() => TransactionId(createId());
  static const empty = TransactionId('');
  bool get isEmpty => value.isEmpty;
  bool get isNotEmpty => value.isNotEmpty;
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
  CurrencyId get currencyId => input.currencyId;
}

/// in int, 100% = 100, 50% = 50
extension type const TaxValue(int value) {
  factory TaxValue.fromJson(final int value) => TaxValue(value);
  int toJson() => value;
  double get percentage => value == 0 ? 0 : value / 100;
  double amount(final double v) => percentage == 0 ? v : v * percentage;
  static const zero = TaxValue(0);
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
  factory Transaction.create({
    required final TransactionType type,
    required final CurrencyType currencyType,
    required final CurrencyId currencyId,
    required final TaskId taskId,
  }) =>
      Transaction(
        transactionDate: DateTime.now(),
        type: type,
        input: InputMoney.fromCurrency(
          type: currencyType,
          id: currencyId,
        ),
        taskId: taskId,
      );

  const Transaction._();

  factory Transaction.fromJson(final Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  static final empty = Transaction(transactionDate: DateTime.now());

  bool get isExpense => type == TransactionType.expense;
  bool get isIncome => type == TransactionType.income;
  bool get isRegular => taskId.isNotEmpty;
  CurrencyId get currencyId => input.currencyId;
  bool get isExists => id.isNotEmpty;
}

/// Represents a monetary value in a specific fiat or crypto currency
@freezed
class InputMoney with _$InputMoney {
  const factory InputMoney.fiat({
    @Default(CurrencyId.empty) final CurrencyId currencyId,
    @Default(0.0) final double amountWithTax,
    @Default(CurrencyType.fiat) final CurrencyType currencyType,
    @Default(TaxValue.zero) final TaxValue tax,
  }) = FiatInputModel;
  const factory InputMoney.crypto({
    @Default(CurrencyId.empty) final CurrencyId currencyId,
    @Default(0.0) final double amountWithTax,
    @Default(CurrencyType.crypto) final CurrencyType currencyType,
    @Default(TaxValue.zero) final TaxValue tax,
  }) = CyptoInputModel;

  const InputMoney._();
  factory InputMoney.fromJson(final Map<String, dynamic> json) =>
      _$InputMoneyFromJson(json);
  factory InputMoney.fromCurrency({
    required final CurrencyId id,
    required final CurrencyType type,
  }) =>
      switch (type) {
        CurrencyType.crypto => InputMoney.crypto(
            currencyId: id,
            currencyType: type,
          ),
        CurrencyType.fiat => InputMoney.fiat(
            currencyId: id,
            currencyType: type,
          ),
      };
  double get amountTaxFree => tax.amount(amountWithTax);
  double amount({required final bool taxFree}) =>
      taxFree ? amountTaxFree : amountWithTax;
  static const empty = FiatInputModel();
}

extension TransactionListX on List<Transaction> {
  double sumForPeriod(final Period period, {final bool taxFree = true}) {
    final now = DateTime.now();
    return fold(
      0,
      (final previousValue, final e) {
        final diff = now.difference(e.transactionDate);
        final days = diff.inDays.whenZeroUse(1);
        final amount = e.input.amount(taxFree: taxFree);
        final periodDays = switch (period) {
          Period.daily => 1,
          Period.weekly => 7,
          Period.monthly => 30,
          Period.yearly => 365,
        };

        return previousValue + ((amount / days) * periodDays);
      },
    );
  }
}

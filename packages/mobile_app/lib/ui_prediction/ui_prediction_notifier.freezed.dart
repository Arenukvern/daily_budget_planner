// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_prediction_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UiPredictionState {
  DateTime get selectedDate => throw _privateConstructorUsedError;
  Period get period => throw _privateConstructorUsedError;
  List<Transaction> get expenses => throw _privateConstructorUsedError;
  List<Budget> get budgets => throw _privateConstructorUsedError;
  List<Transaction> get incomes => throw _privateConstructorUsedError;

  /// budget difference expenses
  double get totalExpensesSum => throw _privateConstructorUsedError;
  double get totalIncomesSum => throw _privateConstructorUsedError;

  /// calculated from specific dates && !isRegular
  double get oneTimeIncomesSum => throw _privateConstructorUsedError;

  /// calculated from specific dates && !isRegular
  double get oneTimeExpensesSum => throw _privateConstructorUsedError;

  /// is difference between regularIncomesSum + regularExpensesSum,
  /// divided by quantity of days left in the period setted in
  /// the income date.
  double get dailyBudget => throw _privateConstructorUsedError;
  bool get isTaxFree => throw _privateConstructorUsedError;
  bool get countWithTransfers => throw _privateConstructorUsedError;

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UiPredictionStateCopyWith<UiPredictionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiPredictionStateCopyWith<$Res> {
  factory $UiPredictionStateCopyWith(
          UiPredictionState value, $Res Function(UiPredictionState) then) =
      _$UiPredictionStateCopyWithImpl<$Res, UiPredictionState>;
  @useResult
  $Res call(
      {DateTime selectedDate,
      Period period,
      List<Transaction> expenses,
      List<Budget> budgets,
      List<Transaction> incomes,
      double totalExpensesSum,
      double totalIncomesSum,
      double oneTimeIncomesSum,
      double oneTimeExpensesSum,
      double dailyBudget,
      bool isTaxFree,
      bool countWithTransfers});
}

/// @nodoc
class _$UiPredictionStateCopyWithImpl<$Res, $Val extends UiPredictionState>
    implements $UiPredictionStateCopyWith<$Res> {
  _$UiPredictionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? period = null,
    Object? expenses = null,
    Object? budgets = null,
    Object? incomes = null,
    Object? totalExpensesSum = null,
    Object? totalIncomesSum = null,
    Object? oneTimeIncomesSum = null,
    Object? oneTimeExpensesSum = null,
    Object? dailyBudget = null,
    Object? isTaxFree = null,
    Object? countWithTransfers = null,
  }) {
    return _then(_value.copyWith(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      budgets: null == budgets
          ? _value.budgets
          : budgets // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      incomes: null == incomes
          ? _value.incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      totalExpensesSum: null == totalExpensesSum
          ? _value.totalExpensesSum
          : totalExpensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncomesSum: null == totalIncomesSum
          ? _value.totalIncomesSum
          : totalIncomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      oneTimeIncomesSum: null == oneTimeIncomesSum
          ? _value.oneTimeIncomesSum
          : oneTimeIncomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      oneTimeExpensesSum: null == oneTimeExpensesSum
          ? _value.oneTimeExpensesSum
          : oneTimeExpensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBudget: null == dailyBudget
          ? _value.dailyBudget
          : dailyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      isTaxFree: null == isTaxFree
          ? _value.isTaxFree
          : isTaxFree // ignore: cast_nullable_to_non_nullable
              as bool,
      countWithTransfers: null == countWithTransfers
          ? _value.countWithTransfers
          : countWithTransfers // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiPredictionStateImplCopyWith<$Res>
    implements $UiPredictionStateCopyWith<$Res> {
  factory _$$UiPredictionStateImplCopyWith(_$UiPredictionStateImpl value,
          $Res Function(_$UiPredictionStateImpl) then) =
      __$$UiPredictionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime selectedDate,
      Period period,
      List<Transaction> expenses,
      List<Budget> budgets,
      List<Transaction> incomes,
      double totalExpensesSum,
      double totalIncomesSum,
      double oneTimeIncomesSum,
      double oneTimeExpensesSum,
      double dailyBudget,
      bool isTaxFree,
      bool countWithTransfers});
}

/// @nodoc
class __$$UiPredictionStateImplCopyWithImpl<$Res>
    extends _$UiPredictionStateCopyWithImpl<$Res, _$UiPredictionStateImpl>
    implements _$$UiPredictionStateImplCopyWith<$Res> {
  __$$UiPredictionStateImplCopyWithImpl(_$UiPredictionStateImpl _value,
      $Res Function(_$UiPredictionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? period = null,
    Object? expenses = null,
    Object? budgets = null,
    Object? incomes = null,
    Object? totalExpensesSum = null,
    Object? totalIncomesSum = null,
    Object? oneTimeIncomesSum = null,
    Object? oneTimeExpensesSum = null,
    Object? dailyBudget = null,
    Object? isTaxFree = null,
    Object? countWithTransfers = null,
  }) {
    return _then(_$UiPredictionStateImpl(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as Period,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      budgets: null == budgets
          ? _value._budgets
          : budgets // ignore: cast_nullable_to_non_nullable
              as List<Budget>,
      incomes: null == incomes
          ? _value._incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
      totalExpensesSum: null == totalExpensesSum
          ? _value.totalExpensesSum
          : totalExpensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncomesSum: null == totalIncomesSum
          ? _value.totalIncomesSum
          : totalIncomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      oneTimeIncomesSum: null == oneTimeIncomesSum
          ? _value.oneTimeIncomesSum
          : oneTimeIncomesSum // ignore: cast_nullable_to_non_nullable
              as double,
      oneTimeExpensesSum: null == oneTimeExpensesSum
          ? _value.oneTimeExpensesSum
          : oneTimeExpensesSum // ignore: cast_nullable_to_non_nullable
              as double,
      dailyBudget: null == dailyBudget
          ? _value.dailyBudget
          : dailyBudget // ignore: cast_nullable_to_non_nullable
              as double,
      isTaxFree: null == isTaxFree
          ? _value.isTaxFree
          : isTaxFree // ignore: cast_nullable_to_non_nullable
              as bool,
      countWithTransfers: null == countWithTransfers
          ? _value.countWithTransfers
          : countWithTransfers // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UiPredictionStateImpl implements _UiPredictionState {
  const _$UiPredictionStateImpl(
      {required this.selectedDate,
      this.period = Period.monthly,
      final List<Transaction> expenses = const [],
      final List<Budget> budgets = const [],
      final List<Transaction> incomes = const [],
      this.totalExpensesSum = 0,
      this.totalIncomesSum = 0,
      this.oneTimeIncomesSum = 0,
      this.oneTimeExpensesSum = 0,
      this.dailyBudget = 0,
      this.isTaxFree = kAmountsTaxFree,
      this.countWithTransfers = false})
      : _expenses = expenses,
        _budgets = budgets,
        _incomes = incomes;

  @override
  final DateTime selectedDate;
  @override
  @JsonKey()
  final Period period;
  final List<Transaction> _expenses;
  @override
  @JsonKey()
  List<Transaction> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  final List<Budget> _budgets;
  @override
  @JsonKey()
  List<Budget> get budgets {
    if (_budgets is EqualUnmodifiableListView) return _budgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgets);
  }

  final List<Transaction> _incomes;
  @override
  @JsonKey()
  List<Transaction> get incomes {
    if (_incomes is EqualUnmodifiableListView) return _incomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomes);
  }

  /// budget difference expenses
  @override
  @JsonKey()
  final double totalExpensesSum;
  @override
  @JsonKey()
  final double totalIncomesSum;

  /// calculated from specific dates && !isRegular
  @override
  @JsonKey()
  final double oneTimeIncomesSum;

  /// calculated from specific dates && !isRegular
  @override
  @JsonKey()
  final double oneTimeExpensesSum;

  /// is difference between regularIncomesSum + regularExpensesSum,
  /// divided by quantity of days left in the period setted in
  /// the income date.
  @override
  @JsonKey()
  final double dailyBudget;
  @override
  @JsonKey()
  final bool isTaxFree;
  @override
  @JsonKey()
  final bool countWithTransfers;

  @override
  String toString() {
    return 'UiPredictionState(selectedDate: $selectedDate, period: $period, expenses: $expenses, budgets: $budgets, incomes: $incomes, totalExpensesSum: $totalExpensesSum, totalIncomesSum: $totalIncomesSum, oneTimeIncomesSum: $oneTimeIncomesSum, oneTimeExpensesSum: $oneTimeExpensesSum, dailyBudget: $dailyBudget, isTaxFree: $isTaxFree, countWithTransfers: $countWithTransfers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiPredictionStateImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses) &&
            const DeepCollectionEquality().equals(other._budgets, _budgets) &&
            const DeepCollectionEquality().equals(other._incomes, _incomes) &&
            (identical(other.totalExpensesSum, totalExpensesSum) ||
                other.totalExpensesSum == totalExpensesSum) &&
            (identical(other.totalIncomesSum, totalIncomesSum) ||
                other.totalIncomesSum == totalIncomesSum) &&
            (identical(other.oneTimeIncomesSum, oneTimeIncomesSum) ||
                other.oneTimeIncomesSum == oneTimeIncomesSum) &&
            (identical(other.oneTimeExpensesSum, oneTimeExpensesSum) ||
                other.oneTimeExpensesSum == oneTimeExpensesSum) &&
            (identical(other.dailyBudget, dailyBudget) ||
                other.dailyBudget == dailyBudget) &&
            (identical(other.isTaxFree, isTaxFree) ||
                other.isTaxFree == isTaxFree) &&
            (identical(other.countWithTransfers, countWithTransfers) ||
                other.countWithTransfers == countWithTransfers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedDate,
      period,
      const DeepCollectionEquality().hash(_expenses),
      const DeepCollectionEquality().hash(_budgets),
      const DeepCollectionEquality().hash(_incomes),
      totalExpensesSum,
      totalIncomesSum,
      oneTimeIncomesSum,
      oneTimeExpensesSum,
      dailyBudget,
      isTaxFree,
      countWithTransfers);

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UiPredictionStateImplCopyWith<_$UiPredictionStateImpl> get copyWith =>
      __$$UiPredictionStateImplCopyWithImpl<_$UiPredictionStateImpl>(
          this, _$identity);
}

abstract class _UiPredictionState implements UiPredictionState {
  const factory _UiPredictionState(
      {required final DateTime selectedDate,
      final Period period,
      final List<Transaction> expenses,
      final List<Budget> budgets,
      final List<Transaction> incomes,
      final double totalExpensesSum,
      final double totalIncomesSum,
      final double oneTimeIncomesSum,
      final double oneTimeExpensesSum,
      final double dailyBudget,
      final bool isTaxFree,
      final bool countWithTransfers}) = _$UiPredictionStateImpl;

  @override
  DateTime get selectedDate;
  @override
  Period get period;
  @override
  List<Transaction> get expenses;
  @override
  List<Budget> get budgets;
  @override
  List<Transaction> get incomes;

  /// budget difference expenses
  @override
  double get totalExpensesSum;
  @override
  double get totalIncomesSum;

  /// calculated from specific dates && !isRegular
  @override
  double get oneTimeIncomesSum;

  /// calculated from specific dates && !isRegular
  @override
  double get oneTimeExpensesSum;

  /// is difference between regularIncomesSum + regularExpensesSum,
  /// divided by quantity of days left in the period setted in
  /// the income date.
  @override
  double get dailyBudget;
  @override
  bool get isTaxFree;
  @override
  bool get countWithTransfers;

  /// Create a copy of UiPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UiPredictionStateImplCopyWith<_$UiPredictionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

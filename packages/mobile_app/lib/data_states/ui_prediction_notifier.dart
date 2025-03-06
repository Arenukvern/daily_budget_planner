import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_app/common_imports.dart';

class UiPredictionNotifier with HasLocalApis, HasNotifiers, HasResources {
  UiPredictionNotifier();
  final timelineNotifier = UiTimelineNotifier(
    state: UiTimelineState.create(
      presentationType: UiPresentationType.day,
      initialDate: DateTime.now(),
    ),
  );
  Future<void> onLoad() async {
    _recalculateSums();
  }

  void _recalculateSums() {
    _recalculateTotalExpensesSum();
    _recalculateTotalIncomesSum();
  }

  void onSelectedPeriodChanged(final Period period) {
    value = value.copyWith(period: period);
    _recalculateSums();
  }

  DateTime get _startDate => value.selectedDate.toDayBeginning;
  DateTime get _endDate => _startDate.add(value.period.duration).toDayEnd;

  @override
  void dispose() {
    timelineNotifier.dispose();
    super.dispose();
  }

  DateTime get selectedDate => value.selectedDate;

  void onSelectedDateChanged(final DateTime newDate) {
    value = value.copyWith(selectedDate: newDate);
    _recalculateSums();
  }

  // TODO(arenukvern): make dependent from period
  double getExpensePredictionFor(final DateTime date) => 0;

  Future<void> removeBudget(final BudgetId budgetId) async {
    await manualBudgetsLocalApi.deleteBudget(budgetId);
    budgetsResource.deleteBudget(budgetId);
  }

  Future<void> upsertBudget(
    final Budget budget, {
    final bool isNew = false,
  }) async {
    await manualBudgetsLocalApi.upsertBudget(budget);
    budgetsResource.upsertBudget(budget);
  }

  Future<void> upsertTransaction(final TransactionEditorResult result) async {
    final (:transaction, :scheduledTransaction) = result;
    await transactionsLocalApi.upsertTransaction(transaction);

    if (scheduledTransaction.isSet) {
      await scheduledTransactionsLocalApi.upsertScheduledTransaction(
        scheduledTransaction,
      );
    }
    switch (transaction.type) {
      case TransactionType.expense:
        _recalculateTotalExpensesSum();
      case TransactionType.income:
        _recalculateTotalIncomesSum();
      case TransactionType.transferIn:
      case TransactionType.transferOut:
      // TODO(arenukvern): implement
    }
  }

  Future<void> upsertIncome(final Transaction income) async {
    await transactionsLocalApi.upsertTransaction(income);

    _recalculateTotalIncomesSum();
  }
}

import 'package:mobile_app/common_imports.dart';

extension type _BudgetRequestKey(String value) {
  factory _BudgetRequestKey.byDate({
    required final DateTime startDate,
    required final Period period,
  }) =>
      _BudgetRequestKey(
        '${startDate.toUtc().toIso8601String()}:${period.inDays}',
      );
}

@stateDistributor
class BudgetsDistributor with ChangeNotifier {
  BudgetsDistributor();

  var _budgets = <_BudgetRequestKey, List<Budget>>{}.unmodifiable;
  var _recentBudget = Budget.empty;

  Budget get recentBudget => _recentBudget;
  void setRecentBudget(final Budget budget) {
    _recentBudget = budget;
    notifyListeners();
  }

  void deleteBudget(final BudgetId budgetId) {
    final updatedBudgetRequests = <_BudgetRequestKey, List<Budget>>{};
    for (final MapEntry(:key, value: budgets) in _budgets.entries) {
      final updatedBudgets = <Budget>[];
      for (final budget in budgets) {
        if (budget.id != budgetId) {
          updatedBudgets.add(budget);
        }
      }
      if (updatedBudgets.isNotEmpty) {
        updatedBudgetRequests.addAll({key: updatedBudgets});
      }
    }
    _budgets = updatedBudgetRequests.unmodifiable;
    notifyListeners();
  }

  void onLoad({
    required final DateTime startDate,
    required final Period period,
    required final List<Budget> budgets,
  }) {
    _budgets = {
      ..._budgets,
      _BudgetRequestKey.byDate(
        startDate: startDate,
        period: period,
      ): budgets,
    }.unmodifiable;
    notifyListeners();
  }
}

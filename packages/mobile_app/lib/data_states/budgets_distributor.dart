import 'package:mobile_app/common_imports.dart';

@stateDistributor
class BudgetsDistributor with ChangeNotifier {
  BudgetsDistributor();

  var _recentBudget = Budget.empty;

  Budget get recentBudget => _recentBudget;
  void setRecentBudget(final Budget budget) {
    _recentBudget = budget;
    notifyListeners();
  }

  void deleteBudget(final BudgetId budgetId) {
    notifyListeners();
  }

  void upsertBudget(final Budget budget) {
    notifyListeners();
  }

  void onLoad({
    required final DateTime startDate,
    required final Period period,
    required final List<Budget> budgets,
  }) {
    notifyListeners();
  }
}

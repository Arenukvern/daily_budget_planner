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

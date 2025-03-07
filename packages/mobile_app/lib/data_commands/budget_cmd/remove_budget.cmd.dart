import 'package:mobile_app/common_imports.dart';

class RemoveBudgetCommand with HasLocalApis, HasResources {
  const RemoveBudgetCommand();
  Future<void> execute(final BudgetId budgetId) async {
    await manualBudgetsLocalApi.deleteBudget(budgetId);
    budgetsResource.remove(budgetId);
  }
}

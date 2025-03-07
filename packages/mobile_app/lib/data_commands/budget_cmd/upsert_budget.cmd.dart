import 'package:mobile_app/common_imports.dart';

class UpsertBudgetCommand with HasLocalApis, HasResources {
  const UpsertBudgetCommand();
  Future<void> execute(final Budget budget) async {
    await manualBudgetsLocalApi.upsertBudget(budget);
    budgetsResource.upsertBudget(budget);
  }
}

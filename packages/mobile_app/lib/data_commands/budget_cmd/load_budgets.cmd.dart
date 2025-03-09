import 'package:mobile_app/common_imports.dart';

class LoadBudgetsCmd with HasResources, HasLocalApis {
  const LoadBudgetsCmd();

  Future<void> executeLoad() async {
    final config = predictionConfigResource;
    final budgets = await manualBudgetsLocalApi.getAllBudgetsForPeriod(
      startDate: config.startDate,
      period: config.period,
    );
    budgetsResource.assignAllOrdered(budgets, toKey: (final e) => e.id);
  }

  Future<void> execute() => const CalculateBudgetBalanceCmd().execute((
    startDate: predictionConfigResource.startDate,
    period: predictionConfigResource.period,
  ));
}

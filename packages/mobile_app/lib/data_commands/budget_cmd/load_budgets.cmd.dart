import 'package:mobile_app/common_imports.dart';

class LoadBudgetsCmd with HasResources, HasLocalApis {
  const LoadBudgetsCmd();

  Future<void> execute() => const CalculateBudgetBalanceCmd().execute((
    startDate: predictionConfigResource.startDate,
    period: predictionConfigResource.period,
  ));
}

import 'package:mobile_app/common_imports.dart';

class UiPredictionNotifier with HasLocalApis, HasNotifiers, HasResources {
  UiPredictionNotifier();

  Future<void> onLoad() async {
    _recalculateSums();
  }

  void _recalculateSums() {
    _recalculateTotalExpensesSum();
    _recalculateTotalIncomesSum();
  }

  // TODO(arenukvern): make dependent from period
  double getExpensePredictionFor(final DateTime date) => 0;

  Future<void> upsertIncome(final Transaction income) async {
    await transactionsLocalApi.upsertTransaction(income);

    _recalculateTotalIncomesSum();
  }
}

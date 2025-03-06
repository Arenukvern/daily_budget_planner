import 'package:freezed_annotation/freezed_annotation.dart';
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

  void onSelectedPeriodChanged(final Period period) {
    value = value.copyWith(period: period);
    _recalculateSums();
  }

  void onSelectedDateChanged(final DateTime newDate) {
    value = value.copyWith(selectedDate: newDate);
    _recalculateSums();
  }

  // TODO(arenukvern): make dependent from period
  double getExpensePredictionFor(final DateTime date) => 0;

  Future<void> upsertIncome(final Transaction income) async {
    await transactionsLocalApi.upsertTransaction(income);

    _recalculateTotalIncomesSum();
  }
}

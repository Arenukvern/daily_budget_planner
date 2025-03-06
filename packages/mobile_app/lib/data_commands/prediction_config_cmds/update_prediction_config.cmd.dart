import 'package:mobile_app/common_imports.dart';

class UpdatePredictionConfigCommand with HasLocalApis, HasResources {
  const UpdatePredictionConfigCommand();

  void onSelectedPeriodChanged(final Period period) {
    predictionConfigResource.period = period;
    _recalculateSums();
  }

  void onSelectedDateChanged(final DateTime newDate) {
    predictionConfigResource.selectedDate = newDate;
    _recalculateSums();
  }
}

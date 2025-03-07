import 'package:mobile_app/common_imports.dart';

/// calculated from specific dates && !isRegular
class OneTimeSumResource extends ChangeNotifier {
  double _incomesSum = 0;
  double _expensesSum = 0;
  double _transferInSum = 0;
  double _transferOutSum = 0;
}

extension OneTimeSumResourceX on OneTimeSumResource {
  double get incomesSum => _incomesSum;
  set incomesSum(final double v) => setState(() => _incomesSum = v);

  double get expensesSum => _expensesSum;
  set expensesSum(final double v) => setState(() => _expensesSum = v);

  double get transferInSum => _transferInSum;
  set transferInSum(final double v) => setState(() => _transferInSum = v);

  double get transferOutSum => _transferOutSum;
  set transferOutSum(final double v) => setState(() => _transferOutSum = v);
}

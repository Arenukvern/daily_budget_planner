import 'package:mobile_app/common_imports.dart';

/// calculated from specific dates && !isRegular
class OneTimeSumsResource extends ChangeNotifier {
  double _incomesSum = 0;
  double _expensesSum = 0;
}

extension OneTimeSumsResourceX on OneTimeSumsResource {
  double get incomesSum => _incomesSum;
  set incomesSum(final double v) => setState(() => _incomesSum = v);

  double get expensesSum => _expensesSum;
  set expensesSum(final double v) => setState(() => _expensesSum = v);
}

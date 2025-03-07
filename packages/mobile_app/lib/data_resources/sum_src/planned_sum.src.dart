import 'package:mobile_app/common_imports.dart';

/// ahead of time calculated sum of planned transactions
/// based on tasks and scheduled transactions
class PlannedSumResource extends ChangeNotifier {
  double _expensesSum = 0;
  double _incomesSum = 0;
}

extension PlannedSumResourceX on PlannedSumResource {
  double get balance => _expensesSum - _incomesSum;

  double get expensesSum => _expensesSum;
  set expensesSum(final double v) => setState(() => _expensesSum = v);

  double get incomesSum => _incomesSum;
  set incomesSum(final double v) => setState(() => _incomesSum = v);
}

import 'package:mobile_app/common_imports.dart';

/// ahead of time calculated sum of planned transactions
/// based on tasks and scheduled transactions
class PlannedTotalSumResource extends ChangeNotifier {
  double _expensesSum = 0;
  double _incomesSum = 0;
}

extension PlannedTotalSumResourceX on PlannedTotalSumResource {
  double get balance => _expensesSum - _incomesSum;

  double get expensesSum => _expensesSum;
  set expensesSum(final double v) => setState(() => _expensesSum = v);

  double get incomesSum => _incomesSum;
  set incomesSum(final double v) => setState(() => _incomesSum = v);
}

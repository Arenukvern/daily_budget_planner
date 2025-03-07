import 'package:mobile_app/common_imports.dart';

/// calculated from budgets difference
class TotalSumResource extends ChangeNotifier {
  double _expensesSum = 0;
  double _incomesSum = 0;
}

extension TotalSumResourceX on TotalSumResource {
  double get expensesSum => _expensesSum;
  set expensesSum(final double v) => setState(() => _expensesSum = v);

  double get incomesSum => _incomesSum;
  set incomesSum(final double v) => setState(() => _incomesSum = v);

  double get balance => incomesSum - expensesSum;
}

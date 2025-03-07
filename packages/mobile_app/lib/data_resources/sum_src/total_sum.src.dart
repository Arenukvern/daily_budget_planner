import 'package:mobile_app/common_imports.dart';

/// calculated from budgets difference
class TotalSumResource extends ChangeNotifier {
  double _expensesSum = 0;
  double _incomesSum = 0;
  double _balance = 0;
}

extension TotalSumResourceX on TotalSumResource {
  double get expensesSum => _expensesSum;
  set expensesSum(final double v) => setState(() => _expensesSum = v);

  double get incomesSum => _incomesSum;
  set incomesSum(final double v) => setState(() => _incomesSum = v);

  set balance(final double v) => setState(() => _balance = v);
  double get balance => _balance.whenZeroUse(incomesSum - expensesSum);
}

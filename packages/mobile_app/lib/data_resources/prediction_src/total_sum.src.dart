import 'package:mobile_app/common_imports.dart';

/// calculated from budgets difference
class TotalSumResource extends ChangeNotifier {
  double _totalExpensesSum = 0;
  double _totalIncomesSum = 0;
}

extension TotalSumResourceX on TotalSumResource {
  double get totalExpensesSum => _totalExpensesSum;
  set totalExpensesSum(final double v) => setState(() => _totalExpensesSum = v);

  double get totalIncomesSum => _totalIncomesSum;
  set totalIncomesSum(final double v) => setState(() => _totalIncomesSum = v);
}

import 'package:mobile_app/common_imports.dart';

/// calculated from specific dates && !isRegular
class OneTimeSumsResource extends ChangeNotifier {
  double _oneTimeIncomesSum = 0;
  double _oneTimeExpensesSum = 0;
}

extension OneTimeSumsResourceX on OneTimeSumsResource {
  double get oneTimeIncomesSum => _oneTimeIncomesSum;
  set oneTimeIncomesSum(final double v) =>
      setState(() => _oneTimeIncomesSum = v);

  double get oneTimeExpensesSum => _oneTimeExpensesSum;
  set oneTimeExpensesSum(final double v) =>
      setState(() => _oneTimeExpensesSum = v);
}

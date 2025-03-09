import 'package:mobile_app/common_imports.dart';

@stateDistributor
class BudgetsResource extends OrderedMapNotifier<BudgetId, Budget> {
  BudgetsResource() : super(toKey: (final budget) => budget.id);
}

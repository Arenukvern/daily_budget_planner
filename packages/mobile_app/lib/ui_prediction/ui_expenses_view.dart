import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/ui_incomes_view.dart';

class UiExpensesView extends StatelessWidget {
  const UiExpensesView({this.isRegular = false, super.key});
  final bool isRegular;
  static Future<void> show({
    required final BuildContext context,
    final bool isRegular = false,
  }) async =>
      Navigator.of(context).push(
        CupertinoModalSheetRoute(
          builder: (final _) => UiBottomSheetWrapper(
            child: UiExpensesView(isRegular: isRegular),
          ),
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final expenses = context.select<UiPredictionNotifier, List<Transaction>>(
      (final state) => state.value.expenses,
    );

    return UiColumnScaffold(
      appBar: UiAppBar(
        titleText: isRegular ? 'Regular expenses' : 'Expenses',
        automaticallyImplyLeading: false,
        trailing: UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: ExpenseTable(
            expenses: expenses,
            isRegular: isRegular,
          ),
        ),
        UiTransactionsActionsBar(
          tuple: (type: TransactionType.expense,),
        ),
        Gap(8),
        UiSafeArea.bottom(),
      ],
    );
  }
}

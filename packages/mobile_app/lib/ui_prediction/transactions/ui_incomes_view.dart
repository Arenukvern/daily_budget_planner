import 'package:mobile_app/common_imports.dart';

class UiIncomesView extends StatelessWidget {
  const UiIncomesView({this.isRegular = false, super.key});
  final bool isRegular;
  static Future<void> show({
    required final BuildContext context,
    final bool isRegular = false,
  }) async =>
      Navigator.of(context).push(
        CupertinoModalSheetRoute(
          builder: (final _) => UiBottomSheetWrapper(
            child: UiIncomesView(isRegular: isRegular),
          ),
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final incomes = context.select<UiPredictionNotifier, List<Transaction>>(
      (final state) => state.value.incomes,
    );

    return UiColumnScaffold(
      appBar: UiAppBar(
        titleText: isRegular ? 'Regular incomes' : 'Incomes',
        automaticallyImplyLeading: false,
        trailing: UiTextActionButton.done(),
      ),
      children: [
        Expanded(
          child: IncomeTable(
            incomes: incomes,
            isRegular: isRegular,
          ),
        ),
        UiTransactionsActionsBar(
          tuple: (type: TransactionType.income,),
        ),
        Gap(8),
        UiSafeArea.bottom(),
      ],
    );
  }
}

class IncomeTable extends HookWidget {
  const IncomeTable({
    required this.incomes,
    required this.isRegular,
    super.key,
  });

  final List<Transaction> incomes;
  final bool isRegular;

  @override
  Widget build(final BuildContext context) {
    final filteredIncomes = useMemoized(
      () => incomes
          .where(
            (final income) => income.isRegular == isRegular && income.isIncome,
          )
          .toList(),
      [incomes, isRegular],
    );

    return UiTransactionsTable<Transaction>(transactions: filteredIncomes);
  }
}

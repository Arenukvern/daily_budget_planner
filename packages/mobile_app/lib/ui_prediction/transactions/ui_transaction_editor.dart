import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/transaction_editor_widgets/transaction_editor_widgets.dart';

part 'ui_transaction_editor_state.dart';

@immutable
class TransactionEditorDto {
  const TransactionEditorDto({
    this.isTypeChangable = false,
    this.isTaskChoosable = false,
  });
  final bool isTypeChangable;
  final bool isTaskChoosable;
  static const empty = TransactionEditorDto();
}

Map<TransactionType, String> getTransactionTypeNames({
  required final CurrencyType currencyType,
  required final Locale locale,
}) =>
    {
      ...switch (currencyType) {
        CurrencyType.fiat => {
            TransactionType.income: 'Income',
            TransactionType.expense: 'Expense',
          },
        CurrencyType.crypto => {
            TransactionType.income: 'Buy',
            TransactionType.expense: 'Sell',
          },
      },
      TransactionType.transferIn: 'Transfer in',
      TransactionType.transferOut: 'Transfer out',
    };

Future<Transaction?> showTransactionEditor(
  final BuildContext context, {
  required final Transaction transaction,
  final Task task = Task.empty,
  final TransactionEditorDto dto = TransactionEditorDto.empty,
}) =>
    Navigator.push(
      context,
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (final context) => _TransactionEditor(
          transaction: transaction,
          dto: dto,
        ),
      ),
    );

class _TransactionEditor extends StatefulHookWidget {
  const _TransactionEditor({
    required this.transaction,
    required this.dto,
  });

  final Transaction transaction;
  final TransactionEditorDto dto;
  @override
  State<_TransactionEditor> createState() => _TransactionEditorState();
}

class _TransactionEditorState extends State<_TransactionEditor> with HasStates {
  late final _EditingController controller = _EditingController(
    transaction: widget.transaction,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> onPopInvoked() async {
    if (!controller.canCompose) {
      // Dismiss immediately if there are no unsaved changes.
      Navigator.pop(context);
      return;
    }

    // Show a confirmation dialog.
    final shouldPop = await showDialog(
      context: context,
      builder: (final context) => AlertDialog(
        title: const Text('Discard changes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Discard'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (shouldPop == true && mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(final BuildContext context) {
    final dto = widget.dto;
    useListenable(controller);
    final locale = useLocale(context);
    final transaction = controller.transaction;
    final isNew = controller.isNew;
    final currencyType = transaction.input.currencyType;
    final transactionTypeNames = getTransactionTypeNames(
      currencyType: currencyType,
      locale: locale,
    );
    final amountField = TransactionAmountField(
      controller: controller.amount,
      currencyType: currencyType,
      currencyId: transaction.input.currencyId,
    );

    final nameField = TransactionNameField(
      name: transaction.description,
      onChanged: (final value) => controller
          .setState((final state) => state.copyWith(description: value)),
    );
    final noteField = TransactionNoteField(
      note: transaction.note,
      onChanged: (final value) =>
          controller.setState((final state) => state.copyWith(note: value)),
    );

    final body = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: UiAppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    '${isNew ? 'Add' : 'Edit'} '
                    '${transactionTypeNames[transaction.type]!}',
                  ),
                  trailing: UiTextActionButton.cancel(),
                ),
              ),
            ],
          ),
          CurrencyTypeField(
            currencyType: currencyType,
            onChanged: (final value) => controller
                .setMoney((final state) => state.copyWith(currencyType: value)),
          ),
          Gap(16),
          if (dto.isTypeChangable) ...[
            TransactionTypeField(
              currencyType: currencyType,
              value: transaction.type,
              onChanged: (final value) => controller
                  .setState((final state) => state.copyWith(type: value)),
            ),
            Gap(16),
          ],
          if (Envs.isCurrencySwitchingEnabled) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CurrencyAutoCompleter(
                onSelected: (final selection) => controller.setMoney(
                  (final state) => state.copyWith(
                    currencyId: selection,
                    currencyType: dictionariesNotifier
                        .getCurrency(selection, currencyType)
                        .type,
                  ),
                ),
                type: currencyType,
              ),
            ),
            Gap(16),
          ],
          if (currencyType case CurrencyType.fiat) ...[
            nameField,
            Gap(16),
          ],

          /// there is two cases:
          /// when it's crypto:
          /// - sum should be calculated in Quantity * Coin price
          ///
          /// when it's fiat:
          /// - sum is just amount
          // TODO(arenukvern): add crypto amount
          ...switch (transaction.input.currencyType) {
            CurrencyType.fiat => [amountField],
            CurrencyType.crypto => [
                amountField,
                Gap(16),
                CoinPriceField(controller: controller.coinPrice),
                Gap(16),
              ],
          },
          if (currencyType case CurrencyType.crypto) noteField,
          Gap(16),
          DatetimeField(
            date: transaction.transactionDate,
            onChanged: (final value) => controller.setState(
              (final state) => state.copyWith(transactionDate: value),
            ),
          ),
          Gap(24),
        ],
      ),
    );

    return UiBottomSheetScaffold(
      body: body,
      bottomBar: UiBottomActionBar(
        children: [
          Expanded(
            child: UiTextButton(
              expands: true,
              onPressed: () {
                final transaction = controller.compose();
                if (transaction != null) {
                  Navigator.pop(context, transaction);
                }
              },
              title: Text(
                '${isNew ? 'Add' : 'Edit'} '
                '${transactionTypeNames[transaction.type]!}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      onPopInvoked: onPopInvoked,
    );
  }
}

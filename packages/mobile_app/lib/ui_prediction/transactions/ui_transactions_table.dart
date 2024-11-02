import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class UiTransactionsTable<T extends Transaction> extends HookWidget {
  const UiTransactionsTable({
    required this.transactions,
    super.key,
  });

  final List<T> transactions;

  @override
  Widget build(final BuildContext context) {
    final sortColumn = useState('date');
    final ascending = useState(true);
    final filteredTransactions = useState([...transactions]);

    useEffect(
      () {
        filteredTransactions.value = [...transactions];
        _sortData(filteredTransactions, sortColumn.value, ascending.value);
        return null;
      },
      [transactions, sortColumn.value, ascending.value],
    );

    return TableView.builder(
      columnCount: 3,
      rowCount: filteredTransactions.value.length + 1,
      columnBuilder: (final columnIndex) {
        switch (columnIndex) {
          case 0:
            return TableSpan(
              extent: const FixedTableSpanExtent(150),
            );
          default:
            return const TableSpan(
              extent: FixedTableSpanExtent(80),
            );
        }
      },
      pinnedRowCount: 1,
      rowBuilder: (final rowIndex) => const TableSpan(
        extent: FixedTableSpanExtent(50),
      ),
      cellBuilder: (final context, final vicinity) {
        if (vicinity.row == 0) {
          return TableViewCell(
            child: _buildHeaderCell(
              context,
              vicinity.column,
              sortColumn,
              ascending,
            ),
          );
        }
        return TableViewCell(
          child: _buildDataCell(
            context,
            vicinity.column,
            filteredTransactions.value[vicinity.row - 1],
          ),
        );
      },
    );
  }

  Widget _buildHeaderCell(
    final BuildContext context,
    final int columnIndex,
    final ValueNotifier<String> sortColumn,
    final ValueNotifier<bool> ascending,
  ) {
    final headers = ['Date', 'Value', 'Currency'];
    final columnNames = ['date', 'value', 'currency'];

    return GestureDetector(
      onTap: () => _onSort(columnNames[columnIndex], sortColumn, ascending),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(headers[columnIndex]),
            if (sortColumn.value == columnNames[columnIndex])
              Icon(
                ascending.value ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCell(
    final BuildContext context,
    final int columnIndex,
    final T transaction,
  ) {
    final cellData = [
      DateFormat.yMMMEd().add_Hms().format(transaction.transactionDate),
      transaction.amount.toString(),
      transaction.currencyId.value,
    ];

    return Container(
      alignment: Alignment.center,
      child: Text(cellData[columnIndex]),
    );
  }

  void _onSort(
    final String column,
    final ValueNotifier<String> sortColumn,
    final ValueNotifier<bool> ascending,
  ) {
    if (sortColumn.value == column) {
      ascending.value = !ascending.value;
    } else {
      sortColumn.value = column;
      ascending.value = true;
    }
  }

  void _sortData(
    final ValueNotifier<List<T>> filteredTransactions,
    final String sortColumn,
    final bool ascending,
  ) {
    filteredTransactions.value.sort((final a, final b) {
      switch (sortColumn) {
        case 'date':
          return ascending
              ? a.transactionDate.compareTo(b.transactionDate)
              : b.transactionDate.compareTo(a.transactionDate);
        case 'value':
          return ascending
              ? a.amount.compareTo(b.amount)
              : b.amount.compareTo(a.amount);
        case 'currency':
          return ascending
              ? a.currencyId.value.compareTo(b.currencyId.value)
              : b.currencyId.value.compareTo(a.currencyId.value);
        default:
          return 0;
      }
    });
  }
}

typedef UiTransactionsActionsBarTuple = ({
  TransactionType type,
});

class UiBottomActionBar extends StatelessWidget {
  const UiBottomActionBar({
    required this.children,
    this.margin,
    super.key,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(final BuildContext context) => SafeArea(
        top: false,
        child: Hero(
          tag: 'bottom-action-bar',
          child: UiBottomActionBarDecorator(
            margin: margin,
            children: children,
          ),
        ),
      );
}

class UiBottomActionBarDecorator extends StatelessWidget {
  const UiBottomActionBarDecorator({
    required this.children,
    this.margin,
    super.key,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: context.colorScheme.surface,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      );
}

class UiTransactionsActionsBar extends StatelessWidget {
  const UiTransactionsActionsBar({required this.tuple, super.key});
  final UiTransactionsActionsBarTuple tuple;
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiBottomActionBar(
      children: [
        const UiBackButton(),
        UiTextButton(
          onPressed: () async {
            final notifier = context.read<UiPredictionNotifier>();
            final transaction = await showTransactionEditor(
              context,
              transaction: null,
            );
            if (transaction == null) return;
            return notifier.upsertTransaction(transaction);
          },
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              Gap(4),
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Add ${tuple.type.name}',
                    languages.it: 'Aggiungi ${switch (tuple.type) {
                      TransactionType.income => 'entrate',
                      TransactionType.expense => 'spese',
                      TransactionType.transferIn => 'transferenze in',
                      TransactionType.transferOut => 'transferenze out',
                    }}',
                    languages.ru: 'Добавить ${switch (tuple.type) {
                      TransactionType.income => 'доход',
                      TransactionType.expense => 'расход',
                      TransactionType.transferIn => 'входящий перевод',
                      TransactionType.transferOut => 'исходящий перевод',
                    }}',
                  },
                ).getValue(locale),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

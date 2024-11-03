import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';

class UiTasksView2 extends StatelessWidget {
  const UiTasksView2({
    required this.tasks,
    super.key,
  });
  final List<Task> tasks;

  @override
  Widget build(final BuildContext context) => ListView(
        children: [
          ...tasks.map((final task) => UiTaskCard(task: task)),
          const Gap(16),
          UiSafeArea.bottom(),
        ],
      );
}

class UiTaskCard extends StatelessWidget {
  const UiTaskCard({required this.task, super.key});
  final Task task;
  @override
  Widget build(final BuildContext context) {
    final transactions = context.select<TasksNotifier, List<Transaction>>(
      (final c) => c.getTransactionsByTask(task),
    );
    return CupertinoListSection(
      backgroundColor: Colors.transparent,
      header: Row(
        children: [
          UiBaseButton(
            onPressed: () {},
            builder: (final context, final focused, final onlyFocused) => Icon(
              Icons.add,
              color: focused
                  ? null
                  : context.colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
          Gap(4),
          Text(task.title),
        ],
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
      ),
      children: [
        UiTransactionCard(transaction: Transaction.empty),
        ...transactions.map(
          (final transaction) => UiTransactionCard(transaction: transaction),
        ),
      ],
    );
  }
}

class UiTransactionCard extends StatelessWidget {
  const UiTransactionCard({required this.transaction, super.key});
  final Transaction transaction;

  @override
  Widget build(final BuildContext context) => CupertinoListTile(
        leading: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '${transaction.amount.toStringAsFixed(2)} '
            // TODO(arenukvern): show only currency different from default
            '${transaction.input.currencyId.toJson()}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(transaction.description),
        subtitle:
            Text(DateFormat('yyyy-MM-dd').format(transaction.transactionDate)),
        leadingSize: 48,
        trailing: UiBaseButton(
          onPressed: () {},
          builder: (final context, final focused, final onlyFocused) => Icon(
            Icons.remove,
            color:
                focused ? null : context.colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      );
}

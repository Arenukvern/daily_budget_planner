import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';

/// Groups that can be used to organize tasks
enum TaskGrouping {
  date,
  task,
  none,
}

/// Sort fields available for tasks
enum TaskSortField {
  sum,
  date,
  name,
}

class UiTasksView extends HookWidget with HasStates {
  const UiTasksView({
    required this.tasks,
    super.key,
  });

  final List<Task> tasks;

  @override
  Widget build(final BuildContext context) {
    final grouping = useState(TaskGrouping.date);
    final sortField = useState(TaskSortField.date);
    final ascending = useState(false);

    final organizedTasks = useMemoized(
      () => _organizeTasks(
        tasks,
        grouping.value,
        sortField.value,
        ascending.value,
      ),
      [tasks, grouping.value, sortField.value, ascending.value],
    );

    return Column(
      children: [
        _TasksHeader(
          grouping: grouping,
          sortField: sortField,
          ascending: ascending,
        ),
        Expanded(
          child: _TasksList(
            organizedTasks: organizedTasks,
          ),
        ),
      ],
    );
  }

  Map<String, List<Task>> _organizeTasks(
    final List<Task> tasks,
    final TaskGrouping grouping,
    final TaskSortField sortField,
    final bool ascending,
  ) {
    // Sort tasks first
    final sortedTasks = [...tasks]..sort((final a, final b) {
        final comparison = switch (sortField) {
          TaskSortField.sum => tasksNotifier
              .getTransactionsByTask(a)
              .fold<double>(
                0,
                (final sum, final t) =>
                    sum + t.input.amount(taxFree: kAmountsTaxFree),
              )
              .compareTo(
                tasksNotifier.getTransactionsByTask(b).fold<double>(
                      0,
                      (final sum, final t) =>
                          sum + t.input.amount(taxFree: kAmountsTaxFree),
                    ),
              ),
          TaskSortField.date => (tasksNotifier
                        .getTransactionsByTask(a)
                        .firstOrNull
                        ?.transactionDate ??
                    DateTime.now())
                .compareTo(
              tasksNotifier
                      .getTransactionsByTask(b)
                      .firstOrNull
                      ?.transactionDate ??
                  DateTime.now(),
            ),
          TaskSortField.name => a.title.compareTo(b.title),
        };
        return ascending ? comparison : -comparison;
      });

    // Group tasks
    return switch (grouping) {
      TaskGrouping.date => groupByDate(sortedTasks),
      TaskGrouping.task => groupByTaskType(sortedTasks),
      TaskGrouping.none => {'All': sortedTasks},
    };
  }

  Map<String, List<Task>> groupByDate(final List<Task> tasks) {
    final groupedTasks = <String, List<Task>>{};

    // Group tasks by month and year of their first transaction
    for (final task in tasks) {
      final transactions = tasksNotifier.getTransactionsByTask(task);
      final date = transactions.firstOrNull?.transactionDate ?? DateTime.now();
      final monthYear = DateFormat.yMMMM().format(date);

      groupedTasks.putIfAbsent(monthYear, () => []);
      groupedTasks[monthYear]!.add(task);
    }

    return groupedTasks;
  }

  Map<String, List<Task>> groupByTaskType(final List<Task> tasks) {
    final groupedTasks = <String, List<Task>>{};

    // Group tasks by their type
    for (final task in tasks) {
      final typeString = switch (task.type) {
        TaskType.personal => 'Personal Tasks',
        TaskType.business => 'Business Tasks',
      };

      groupedTasks.putIfAbsent(typeString, () => []);
      groupedTasks[typeString]!.add(task);
    }

    return groupedTasks;
  }
}

class _TasksHeader extends StatelessWidget {
  const _TasksHeader({
    required this.grouping,
    required this.sortField,
    required this.ascending,
  });

  final ValueNotifier<TaskGrouping> grouping;
  final ValueNotifier<TaskSortField> sortField;
  final ValueNotifier<bool> ascending;

  @override
  Widget build(final BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: UiSegmentedButton<TaskGrouping>(
                selected: grouping.value,
                onSelectionChanged: (final value) => grouping.value = value,
                segments: const [
                  ButtonSegment(
                    value: TaskGrouping.date,
                    label: Text('By Date'),
                  ),
                  ButtonSegment(
                    value: TaskGrouping.task,
                    label: Text('By Task'),
                  ),
                  ButtonSegment(
                    value: TaskGrouping.none,
                    label: Text('None'),
                  ),
                ],
              ),
            ),
            const Gap(8),
            UiPopupMenuButton<TaskSortField>(
              initialValue: sortField.value,
              onSelected: (final value) => sortField.value = value,
              itemBuilder: (final _) => [
                const PopupMenuItem(
                  value: TaskSortField.sum,
                  child: Text('Sort by Sum'),
                ),
                const PopupMenuItem(
                  value: TaskSortField.date,
                  child: Text('Sort by Date'),
                ),
                const PopupMenuItem(
                  value: TaskSortField.name,
                  child: Text('Sort by Name'),
                ),
              ],
              child: Icon(Icons.sort),
            ),
            IconButton(
              icon: Icon(
                ascending.value ? Icons.arrow_upward : Icons.arrow_downward,
              ),
              onPressed: () => ascending.value = !ascending.value,
            ),
          ],
        ),
      );
}

class _TasksList extends StatelessWidget {
  const _TasksList({
    required this.organizedTasks,
  });

  final Map<String, List<Task>> organizedTasks;

  @override
  Widget build(final BuildContext context) => ListView.builder(
        itemCount: organizedTasks.length,
        itemBuilder: (final context, final index) {
          final group = organizedTasks.keys.elementAt(index);
          final tasks = organizedTasks[group]!;

          return _TaskGroup(
            title: group,
            tasks: tasks,
          );
        },
      );
}

class _TaskGroup extends StatelessWidget {
  const _TaskGroup({
    required this.title,
    required this.tasks,
  });

  final String title;
  final List<Task> tasks;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: context.colorScheme.surfaceVariant,
            child: Text(
              title,
              style: context.textTheme.titleSmall,
            ),
          ),
          ...tasks.map((final task) => _TaskItem(task: task)),
        ],
      );
}

class _TaskItem extends HookWidget {
  const _TaskItem({
    required this.task,
  });

  final Task task;

  @override
  Widget build(final BuildContext context) {
    final isExpanded = useState(false);

    return Column(
      children: [
        ListTile(
          title: Text(task.title),
          subtitle: Text(task.notes),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                switch (task.transactionType) {
                  TaskTransactionType.expense => Icons.arrow_downward,
                  TaskTransactionType.income => Icons.arrow_upward,
                },
                size: 16,
              ),
              const Gap(4),
              IconButton(
                icon: Icon(
                  isExpanded.value ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () => isExpanded.value = !isExpanded.value,
              ),
            ],
          ),
        ),
        if (isExpanded.value) _ExpandedTaskDetails(task: task),
        const Divider(),
      ],
    );
  }
}

class _ExpandedTaskDetails extends StatelessWidget with HasStates {
  const _ExpandedTaskDetails({required this.task});

  final Task task;

  @override
  Widget build(final BuildContext context) {
    final transactions = tasksNotifier.getTransactionsByTask(task);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DetailRow('Status:', task.status.name),
          _DetailRow('Type:', task.type.name),
          _DetailRow(
            'Categories:',
            task.categoryIds.isEmpty
                ? 'None'
                : task.categoryIds.map((final id) => id.value).join(', '),
          ),
          if (transactions.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Transactions:',
              style: context.textTheme.titleSmall,
            ),
            ...transactions.map(
              (final transaction) => ListTile(
                dense: true,
                title: Text(transaction.description),
                trailing: Text(
                  '${transaction.input.amount(taxFree: kAmountsTaxFree)} '
                  '${transaction.currencyId.value}',
                ),
                subtitle: Text(
                  DateFormat.yMMMd().add_Hms().format(
                        transaction.transactionDate,
                      ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Text(
              label,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(8),
            Text(value),
          ],
        ),
      );
}

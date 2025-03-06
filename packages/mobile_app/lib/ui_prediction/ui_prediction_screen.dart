// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/add_budget_dialog.dart';

class UiPredictionScreen extends StatelessWidget {
  const UiPredictionScreen({super.key});

  static Future<void> show(final BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (final _) => const UiPredictionScreen()),
      );

  @override
  Widget build(final BuildContext context) => UiScaffold(
        body: LayoutBuilder(
          builder: (final context, final constraints) {
            final isDesktop = UiLayout.fromConstraints(constraints).isDesktop;

            if (isDesktop) {
              return Column(
                children: [
                  _PredictionHeader(state: state),
                  Expanded(
                    child: DesktopPredictionBody(
                      selectedDate: uiPredictionNotifier.selectedDate,
                      onDateChanged: uiPredictionNotifier.onSelectedDateChanged,
                    ),
                  ),
                  const UiPredictionBottomActionBar(),
                ],
              );
            } else {
              return Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      PinnedHeaderSliver(
                        child: _PredictionHeader(state: state),
                      ),
                      const SliverGap(48),
                      MobilePredictionBody(
                        selectedDate: uiPredictionNotifier.selectedDate,
                        onDateChanged:
                            uiPredictionNotifier.onSelectedDateChanged,
                        uiPredictionNotifier: uiPredictionNotifier,
                      ).toSliver(),
                      const SliverGap(64),
                      const UiSafeArea.bottom().toSliver(),
                    ],
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: UiPredictionBottomActionBar(),
                  ),
                ],
              );
            }
          },
        ),
      );
}

class _PredictionHeader extends StatelessWidget {
  const _PredictionHeader({required this.state});

  final UiPredictionState state;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final tasksNotifier = context.watch<TasksNotifier>();
    final period = context.select<UiPredictionNotifier, Period>(
      (final state) => state.value.period,
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.5),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        border:
            Border.all(color: context.colorScheme.onSurface.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          const UiSafeArea.top(),
          const Gap(12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(6),
                PeriodSelectorButton(
                  period: period,
                ),
                const Spacer(),
                _HeaderItem(
                  onPressed: () async => showExpensesTasksView(
                    context: context,
                  ),
                  title: LocalizedMap(
                    // TODO(arenukvern): add localization l10n
                    value: {
                      languages.en: 'regular expenses',
                      languages.it: 'spese regolari',
                      languages.ru: 'регулярные расходы',
                    },
                  ).getValue(locale),
                  value: '\$${tasksNotifier.getPlannedExpensesSum(
                        startAt: state.selectedDate,
                        period: period,
                        transactionType: TransactionType.expense,
                      ).toStringAsFixed(2)}',
                  icon: Icons.arrow_drop_down_rounded,
                ),
                _HeaderItem(
                  onPressed: () async => showIncomesTasksView(context: context),
                  title: LocalizedMap(
                    // TODO(arenukvern): add localization l10n
                    value: {
                      languages.en: 'regular income',
                      languages.it: 'entrate regolari',
                      languages.ru: 'регулярные доходы',
                    },
                  ).getValue(locale),
                  value: '\$${tasksNotifier.getPlannedIncomesSum(
                        startAt: state.selectedDate,
                        period: period,
                        transactionType: TransactionType.income,
                      ).toStringAsFixed(2)}',
                  icon: Icons.arrow_drop_up_rounded,
                ),
                const Spacer(),
              ],
            ),
          ),
          const Gap(8),
        ],
      ),
    );
  }
}

class PeriodSelectorButton extends HookWidget {
  const PeriodSelectorButton({
    required this.period,
    super.key,
  });

  final Period period;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final controller = useUiPopupButtonController();

    final periodTitle = LocalizedMap(
      value: {
        languages.en: 'period',
        languages.it: 'periodo',
        languages.ru: 'период',
      },
    ).getValue(locale);

    final periodValue = switch (period) {
      Period.weekly => 'week',
      Period.monthly => 'month',
      Period.quarterly => 'quarter',
      Period.yearly => 'year',
      _ => '${period.inDays} days',
    };

    return UiPopupButton(
      controller: controller,
      scaleDirection: UiPopupButtonScaleDirection.down,
      menuBuilder: (final context) => UiPopupDecoration(
        child: _PeriodMenu(
          onPeriodSelected: (final newPeriod) {
            const UpdatePredictionConfigCommand()
                .onSelectedPeriodChanged(newPeriod);
            controller.close();
          },
          selectedPeriod: period,
        ),
      ),
      shouldRotate: false,
      buttonBuilder: (final context, final isVisible, final onPressed) =>
          _HeaderItem(
        onPressed: onPressed,
        title: periodTitle,
        value: periodValue,
      ),
    );
  }
}

class _PeriodMenu extends StatelessWidget {
  const _PeriodMenu({
    required this.onPeriodSelected,
    required this.selectedPeriod,
  });

  final ValueChanged<Period> onPeriodSelected;
  final Period selectedPeriod;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PeriodMenuItem(
            title: 'Weekly',
            period: Period.weekly,
            selectedPeriod: selectedPeriod,
            onSelect: onPeriodSelected,
          ),
          _PeriodMenuItem(
            title: 'Monthly',
            period: Period.monthly,
            selectedPeriod: selectedPeriod,
            onSelect: onPeriodSelected,
          ),
          _PeriodMenuItem(
            title: 'Quarterly',
            period: Period.quarterly,
            selectedPeriod: selectedPeriod,
            onSelect: onPeriodSelected,
          ),
          _PeriodMenuItem(
            title: 'Yearly',
            period: Period.yearly,
            selectedPeriod: selectedPeriod,
            onSelect: onPeriodSelected,
          ),
        ],
      );
}

class _PeriodMenuItem extends StatelessWidget {
  const _PeriodMenuItem({
    required this.title,
    required this.period,
    required this.selectedPeriod,
    required this.onSelect,
  });

  final String title;
  final Period period;
  final Period selectedPeriod;
  final ValueChanged<Period> onSelect;

  @override
  Widget build(final BuildContext context) => UiPopupListTile(
        onTap: () => onSelect(period),
        title: title,
        isSelected: selectedPeriod == period,
      );
}

class _HeaderItem extends StatelessWidget {
  const _HeaderItem({
    required this.title,
    required this.value,
    required this.onPressed,
    this.icon,
  });

  final String title;
  final String value;
  final IconData? icon;
  final VoidCallback onPressed;
  @override
  Widget build(final BuildContext context) => UiTextButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                style: context.textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) Icon(icon),
                Text(
                  value,
                  style: context.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      );
}

class MobilePredictionBody extends StatelessWidget {
  const MobilePredictionBody({
    required this.selectedDate,
    required this.onDateChanged,
    required this.uiPredictionNotifier,
    super.key,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final UiPredictionNotifier uiPredictionNotifier;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (kDebugMode) ...[
            _TrendIndicator(),
            const Gap(6),
          ],
          _BudgetButton(uiPredictionNotifier: uiPredictionNotifier),
          const Gap(24),
          _DailyBudgetDisplay(
            dailyBudget: uiPredictionNotifier.value.dailyBudget,
          ),
          const Gap(24),
          UiHorizontalPredictionTimeline(
            notifier: context.read(),
            onDateChanged: onDateChanged,
          ),
          const Gap(28),
          _DailyStatistics(
            selectedDate: selectedDate,
          ),
        ],
      );
}

class DesktopPredictionBody extends StatelessWidget {
  const DesktopPredictionBody({
    required this.selectedDate,
    required this.onDateChanged,
    super.key,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(final BuildContext context) => Row(
        children: [
          UiVerticalPredictionTimeline(
            notifier: context.read(),
            onDateChanged: onDateChanged,
          ),
          Expanded(
            child: Row(
              children: [
                const Gap(24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _DailyBudgetDisplay(
                      dailyBudget: uiPredictionNotifier.value.dailyBudget,
                    ),
                  ],
                ),
                const Gap(24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (kDebugMode) ...[
                      _TrendIndicator(),
                      const Gap(6),
                    ],
                    const _BudgetButton(),
                    const Gap(24),
                    _DailyStatistics(
                      selectedDate: selectedDate,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}

class _TrendIndicator extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.trending_up_rounded,
            size: 16,
            color: context.colorScheme.onSurface.withOpacity(0.3),
          ),
          const Gap(4),
          Text(
            LocalizedMap(
              value: {
                languages.en: 'Trend: savings left for ~2 days',
                languages.it: 'Tendenza: risparmio rimanente per ~2 giorni',
                languages.ru: 'Тренд: накоплений хватит на ~2 дня',
              },
            ).getValue(locale),
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _BudgetButton extends StatelessWidget {
  const _BudgetButton();

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiBaseButton(
      onPressed: () async => BudgetBottomSheet.show(context),
      builder: (final _, final __, final ___) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 16,
            color: context.colorScheme.onSurface.withOpacity(0.8),
          ),
          const Gap(8),
          Text(
            // TODO(arenukvern): description
            '\$${uiPredictionNotifier.recentBudget.input.amount(taxFree: true).toStringAsFixed(2)} '
            '${LocalizedMap(
              value: {
                languages.en: '- left',
                languages.it: '- rimanenti',
                languages.ru: '- осталось',
              },
            ).getValue(locale)}',
            style: context.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}

class _DailyBudgetDisplay extends StatelessWidget {
  const _DailyBudgetDisplay({required this.dailyBudget});

  final double dailyBudget;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '\$${dailyBudget.toStringAsFixed(2)}',
              style: context.textTheme.displayLarge,
            ),
            const Gap(4),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.copy),
            ),
          ],
        ),
        Text(
          LocalizedMap(
            value: {
              languages.en: 'daily budget',
              languages.it: 'budget giornaliero',
              languages.ru: 'дневной бюджет',
            },
          ).getValue(locale),
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}

class _DailyStatistics extends StatelessWidget {
  const _DailyStatistics({
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final (:state, :balance) = context.select<UiPredictionNotifier,
        ({UiPredictionState state, double balance})>(
      (final state) => (
        state: state.value,
        balance: state.value.totalIncomesSum - state.value.totalExpensesSum,
      ),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          _StatisticItem(
            onPressed: () async => UiExpensesView.show(context: context),
            value: '-\$${state.totalExpensesSum.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'Expenses',
                languages.it: 'Spese',
                languages.ru: 'Расходы',
              },
            ).getValue(locale),
          ),
          _StatisticItem(
            onPressed: () async => UiIncomesView.show(context: context),
            value: '+\$${state.totalIncomesSum.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'Income',
                languages.it: 'Entrate',
                languages.ru: 'Доходы',
              },
            ).getValue(locale),
          ),
          _StatisticItem(
            onPressed: () {},
            value: '\$${balance.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'End of Day Balance',
                languages.it: 'Saldo finale',
                languages.ru: 'Остаток на конец дня',
              },
            ).getValue(locale),
          ),
        ],
      ),
    );
  }
}

class _StatisticItem extends StatelessWidget {
  const _StatisticItem({
    required this.value,
    required this.label,
    required this.onPressed,
  });

  final String value;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(final BuildContext context) => UiBaseButton(
        onPressed: onPressed,
        builder: (final context, final focused, final setFocused) =>
            AnimatedContainer(
          duration: 200.milliseconds,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: focused
                ? context.colorScheme.primaryContainer
                : context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.colorScheme.onSurface.withOpacity(0.05),
            ),
          ),
          child: Column(
            children: [
              Text(
                value,
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(label, style: context.textTheme.labelSmall),
            ],
          ),
        ),
      );
}

class UiPredictionBottomActionBar extends StatelessWidget {
  const UiPredictionBottomActionBar({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return UiBottomActionBar(
      children: [
        const UiCloseButton(),
        UiTextButton(
          onPressed: () async => AddBudgetDialog.show(context),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.add),
              const Gap(4),
              Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Update Budget',
                    languages.it: 'Aggiorna Budget',
                    languages.ru: 'Обновить бюджет',
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

class BudgetBottomSheet extends HookWidget {
  const BudgetBottomSheet({super.key});

  static Future<void> show(final BuildContext context) async =>
      showModalBottomSheet(
        useRootNavigator: true,
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (final context) => DraggableScrollableSheet(
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (final _, final controller) => const BudgetBottomSheet(),
        ),
      );

  @override
  Widget build(final BuildContext context) {
    final uiPredictionNotifier = context.watch<UiPredictionNotifier>();
    final state = uiPredictionNotifier.value;
    final locale = useLocale(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const UiIOSDragHandle(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Text(
              LocalizedMap(
                value: {
                  languages.en: 'Budgets History',
                  languages.it: 'Storico Budget',
                  languages.ru: 'История Бюджетов',
                },
              ).getValue(locale),
              style: context.textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: state.budgets.length,
              itemBuilder: (final context, final index) {
                final budget = state.budgets[index];
                return ListTile(
                  title: Text(
                    // TODO(arenukvern): description
                    '\$${budget.input.amount(taxFree: true).toStringAsFixed(2)}',
                  ),
                  subtitle: Text(
                    DateFormat('EEEE, d MMMM yyyy, h:mm a').format(budget.date),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () async =>
                        uiPredictionNotifier.removeBudget(budget.id),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () async => AddBudgetDialog.show(context),
              child: Text(
                LocalizedMap(
                  value: {
                    languages.en: 'Add New Budget',
                    languages.it: 'Aggiungi Nuovo Budget',
                    languages.ru: 'Добавить Новый Бюджет',
                  },
                ).getValue(locale),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

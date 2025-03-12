// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/add_budget_dialog.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';

class UiPredictionScreenV2 extends StatelessWidget {
  const UiPredictionScreenV2({super.key});

  @override
  Widget build(final BuildContext context) {
    final backgroungColor = context.colorScheme.primary;
    return UiScaffold(
      body: ColoredBox(
        color: backgroungColor,
        child: LayoutBuilder(
          builder: (final context, final constraints) {
            const _ = '';
            final selectedDate = useSelectionDate(context);
            // final isDesktop = UiLayout.fromConstraints(constraints).isDesktop;
            // return isDesktop
            //     ? const DesktopPredictionBody()
            //     : const MobilePredictionBody();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const UiSafeArea.top(),
                const Gap(16),

                Expanded(
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 650),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 56),
                            foregroundDecoration: BoxDecoration(
                              color: backgroungColor.withAlpha(180),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  child: Text(
                                    'thinking per ',
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(
                                          color: context.colorScheme.onPrimary,
                                        ),
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 80,
                                    child: InlineValuePicker<String>(
                                      values: const [
                                        ' year',
                                        ' quarter',
                                        ' month',
                                        ' week',
                                      ],
                                      initialIndex: 1,
                                      onIndexChanged: (final value) {},
                                    ),
                                  ),
                                ),
                                const Gap(16),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  child: Text(
                                    'my goal is to',
                                    style: context.textTheme.labelMedium
                                        ?.copyWith(
                                          color: context.colorScheme.onPrimary,
                                        ),
                                  ),
                                ),
                                Flexible(
                                  child: SizedBox(
                                    width: 200,
                                    child: InlineValuePicker<String>(
                                      values: const [
                                        ' plan ahead (WIP)',
                                        ' look for today',
                                        ' analyze the past (WIP)',
                                      ],
                                      initialIndex: 1,
                                      onIndexChanged: (final value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            constraints: const BoxConstraints(maxHeight: 500),
                            margin: const EdgeInsets.only(
                              left: 32,
                              right: 32,
                              bottom: 32,
                              top: 8,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(child: _MainContentCard()),
                                // const Gap(16),
                                // Container(
                                //   width: 3,
                                //   margin: const EdgeInsets.symmetric(
                                //     vertical: 16,
                                //   ),
                                //   decoration: BoxDecoration(
                                //     borderRadius: const BorderRadius.all(
                                //       Radius.elliptical(32, 32),
                                //     ),
                                //     color: context.colorScheme.primaryContainer
                                //         .withAlpha(100),
                                //   ),
                                // ),
                                // const Gap(16),
                                // _ContentCard(
                                //   constraints: const BoxConstraints(
                                //     maxWidth: 400,
                                //     minWidth: 300,
                                //     maxHeight: 500,
                                //   ),
                                //   color: context.colorScheme.primaryContainer,
                                //   child: const Column(
                                //     children: [Text('Budgets'), Gap(12)],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  foregroundDecoration: BoxDecoration(
                    color: backgroungColor.withAlpha(200),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: _DailyStatistics(selectedDate: selectedDate),
                ),
                const Gap(16),
                const UiSafeArea.bottom(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MainContentCard extends StatelessWidget {
  const _MainContentCard({super.key});

  @override
  Widget build(final BuildContext context) => const _ContentCard(
    constraints: BoxConstraints(maxWidth: 650, maxHeight: 500),
    // constraints: BoxConstraints(maxWidth: 400, maxHeight: 500),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _DailyBudgetDisplay(),
        Gap(32),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_BudgetWillLast(), _TodaysBudget()],
        ),
      ],
    ),
  );
}

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    required this.child,
    required this.constraints,
    this.color,
    super.key,
  });
  final Widget child;
  final Color? color;
  final BoxConstraints constraints;

  @override
  Widget build(final BuildContext context) => Container(
    constraints: constraints,
    decoration: BoxDecoration(
      color: color ?? context.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(16),
    child: DefaultTextStyle.merge(
      style: context.textTheme.labelMedium,
      child: child,
    ),
  );
}

class UiPredictionScreen extends StatelessWidget {
  const UiPredictionScreen({super.key});

  static Future<void> show(final BuildContext context) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (final _) {
        // return const UiPredictionScreen();
        return const UiPredictionScreenV2();
      },
    ),
  );

  @override
  Widget build(final BuildContext context) => UiScaffold(
    body: LayoutBuilder(
      builder: (final context, final constraints) {
        final isDesktop = UiLayout.fromConstraints(constraints).isDesktop;

        if (isDesktop) {
          return const Column(
            children: [
              _PredictionHeader(),
              Expanded(child: DesktopPredictionBody()),
              UiPredictionBottomActionBar(),
            ],
          );
        } else {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  const PinnedHeaderSliver(child: _PredictionHeader()),
                  const SliverGap(48),
                  const MobilePredictionBody().toSliver(),
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
  const _PredictionHeader();

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final period = context.select<PredictionConfigResource, Period>(
      (final state) => state.period,
    );
    final selectedDate = useSelectionDate(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withOpacity(0.5),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
        border: Border.all(
          color: context.colorScheme.onSurface.withOpacity(0.2),
        ),
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
                PeriodSelectorButton(period: period),
                const Spacer(),
                Builder(
                  builder: (final context) {
                    final plannedExpensesSum = context
                        .select<PlannedSumResource, double>(
                          (final state) => state.expensesSum,
                        );

                    return _HeaderItem(
                      onPressed:
                          () async => showExpensesTasksView(context: context),
                      title: LocalizedMap(
                        // TODO(arenukvern): add localization l10n
                        value: {
                          languages.en: 'regular expenses',
                          languages.it: 'spese regolari',
                          languages.ru: 'регулярные расходы',
                        },
                      ).getValue(locale),
                      value: '\$${plannedExpensesSum.toStringAsFixed(2)}',
                      icon: Icons.arrow_drop_down_rounded,
                    );
                  },
                ),
                Builder(
                  builder: (final context) {
                    final plannedIncomesSum = context
                        .select<PlannedSumResource, double>(
                          (final state) => state.incomesSum,
                        );
                    return _HeaderItem(
                      onPressed:
                          () async => showIncomesTasksView(context: context),
                      title: LocalizedMap(
                        // TODO(arenukvern): add localization l10n
                        value: {
                          languages.en: 'regular income',
                          languages.it: 'entrate regolari',
                          languages.ru: 'регулярные доходы',
                        },
                      ).getValue(locale),
                      value: '\$${plannedIncomesSum.toStringAsFixed(2)}',
                      icon: Icons.arrow_drop_up_rounded,
                    );
                  },
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
  const PeriodSelectorButton({required this.period, super.key});

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
      menuBuilder:
          (final context) => UiPopupDecoration(
            child: _PeriodMenu(
              onPeriodSelected: (final newPeriod) {
                const UpdatePredictionConfigCommand().onSelectedPeriodChanged(
                  newPeriod,
                );
                controller.close();
              },
              selectedPeriod: period,
            ),
          ),
      shouldRotate: false,
      buttonBuilder:
          (final context, final isVisible, final onPressed) => _HeaderItem(
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
  const MobilePredictionBody({super.key});

  @override
  Widget build(final BuildContext context) {
    final selectedDate = useSelectionDate(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
        const _BudgetButton(),
        const Gap(24),
        const _DailyBudgetDisplay(),
        const Gap(24),
        UiHorizontalPredictionTimeline(
          notifier: context.read(),
          onDateChanged:
              const UpdatePredictionConfigCommand().onSelectedDateChanged,
        ),
        const Gap(28),
        _DailyStatistics(selectedDate: selectedDate),
      ],
    );
  }
}

class DesktopPredictionBody extends StatelessWidget {
  const DesktopPredictionBody({super.key});

  @override
  Widget build(final BuildContext context) {
    final selectedDate = useSelectionDate(context);
    final dailyBudget = context.watch<DailyBudgetResource>();

    return Row(
      children: [
        UiVerticalPredictionTimeline(
          notifier: context.read(),
          onDateChanged:
              const UpdatePredictionConfigCommand().onSelectedDateChanged,
        ),
        Expanded(
          child: Row(
            children: [
              const Gap(24),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_DailyBudgetDisplay()],
              ),
              const Gap(24),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (kDebugMode) ...[_TrendIndicator(), const Gap(6)],
                  const _BudgetButton(),
                  const Gap(24),
                  _DailyStatistics(selectedDate: selectedDate),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
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
    final recentBudget = context.select<RecentBudgetResource, Budget>(
      (final state) => state.recentBudget,
    );
    return UiBaseButton(
      onPressed: () async => BudgetBottomSheet.show(context),
      builder:
          (final _, final __, final ___) => Row(
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
                '\$${recentBudget.input.amount(taxFree: true).toStringAsFixed(2)} '
                '${LocalizedMap(value: {languages.en: '- left', languages.it: '- rimanenti', languages.ru: '- осталось'}).getValue(locale)}',
                style: context.textTheme.titleLarge,
              ),
            ],
          ),
    );
  }
}

class _DailyBudgetDisplay extends StatelessWidget {
  const _DailyBudgetDisplay();

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final dailyBudget = context.watch<DailyBudgetResource>();
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '\$${dailyBudget.value.toStringAsFixed(2)}',
              style: context.textTheme.displayLarge,
            ),
            const Gap(4),
            IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
          ],
        ),
        Text(
          LocalizedMap(
            value: {
              languages.en: "I can spend today (Today's budget)",
              languages.it: 'Posso spendere oggi (Budget oggi)',
              languages.ru: 'Могу потратить сегодня (Сегодняшний бюджет)',
            },
          ).getValue(locale),
          style: context.textTheme.labelLarge,
        ),
      ],
    );
  }
}

class _DailyStatistics extends StatelessWidget {
  const _DailyStatistics({required this.selectedDate});

  final DateTime selectedDate;

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final totalSumResource = context.watch<TotalSumResource>();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: [
          _StatisticItem(
            onPressed: () async => UiExpensesView.show(context: context),
            value: '-\$${totalSumResource.expensesSum.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'What I spent (Expenses)',
                languages.it: 'Cosa ho speso (Spese)',
                languages.ru: 'Что я потратил (Расходы)',
              },
            ).getValue(locale),
          ),
          _StatisticItem(
            onPressed: () async => UiIncomesView.show(context: context),
            value: '+\$${totalSumResource.incomesSum.toStringAsFixed(2)}',
            label: LocalizedMap(
              value: {
                languages.en: 'What I earned (Income)',
                languages.it: 'Cosa ho guadagnato (Entrate)',
                languages.ru: 'Что я заработал (Доходы)',
              },
            ).getValue(locale),
          ),
        ],
      ),
    );
  }
}

class _BudgetWillLast extends StatelessWidget {
  const _BudgetWillLast({super.key});

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    return _StatisticItem(
      value: '~2 days',
      label: LocalizedMap(
        value: {
          languages.en: 'Budget will last ',
          languages.it: 'Budget rimanente per',
          languages.ru: 'Отстаток. Хватит',
        },
      ).getValue(locale),
      onPressed: () {},
    );
  }
}

class _TodaysBudget extends StatelessWidget {
  const _TodaysBudget({super.key});

  @override
  Widget build(final BuildContext context) {
    final selectedDate = useSelectionDate(context);
    final totalSumResource = context.watch<TotalSumResource>();
    final locale = useLocale(context);
    return Builder(
      builder: (final context) {
        final isToday = selectedDate.isToday;
        final today = DateTime.now();
        final isInFuture = selectedDate.isAfter(today);
        final isInPast = selectedDate.isBefore(today);
        return _StatisticItem(
          onPressed: () async => BudgetBottomSheet.show(context),
          value: '\$${totalSumResource.balance.toStringAsFixed(2)}',
          label: LocalizedMap(
            value: switch (true) {
              _ when isToday => {
                languages.en: 'End of Today Balance',
                languages.it: 'Saldo finale oggi',
                languages.ru: 'Остаток сегодня на конец дня',
              },
              _ when isInFuture => {
                languages.en: 'End of Day Future Balance',
                languages.it: 'Saldo finale futuro',
                languages.ru: 'Остаток на конец дня в будущем',
              },
              _ when isInPast => {
                languages.en: 'End of Day Past Balance',
                languages.it: 'Saldo finale passato',
                languages.ru: 'Остаток на конец дня в прошлом',
              },
              _ => throw UnsupportedError('Unknown date'),
            },
          ).getValue(locale),
        );
      },
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
    builder:
        (final context, final focused, final setFocused) => AnimatedContainer(
          duration: 200.milliseconds,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color:
                focused
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
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
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
        builder:
            (final context) => DraggableScrollableSheet(
              minChildSize: 0.2,
              maxChildSize: 0.9,
              expand: false,
              builder: (final _, final controller) => const BudgetBottomSheet(),
            ),
      );

  @override
  Widget build(final BuildContext context) {
    final locale = useLocale(context);
    final budgets = context.watch<BudgetsResource>();

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
                  languages.en: 'Budget History',
                  languages.it: 'Storico Budget',
                  languages.ru: 'История бюджета',
                },
              ).getValue(locale),
              style: context.textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: budgets.length,
              itemBuilder: (final context, final index) {
                final budget = budgets.orderedValues[index];
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
                    onPressed:
                        () async =>
                            const RemoveBudgetCommand().execute(budget.id),
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

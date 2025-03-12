import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_prediction/tasks/ui_tasks_actions_bar.dart';
import 'package:recase/recase.dart';

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
                            margin: const EdgeInsets.only(left: 56, right: 56),
                            foregroundDecoration: BoxDecoration(
                              // color: backgroungColor.withAlpha(180),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                  child: DailyStatistics(selectedDate: selectedDate),
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

class PeriodSelector extends StatelessWidget {
  const PeriodSelector({super.key});

  @override
  Widget build(final BuildContext context) {
    final period = context.select<PredictionConfigResource, Period>(
      (final state) => state.period,
    );
    return UiSegmentedButton(
      segments:
          const [Period.weekly, Period.monthly, Period.quarterly, Period.yearly]
              .map(
                (final e) => ButtonSegment(
                  value: e,
                  label: Text(
                    switch (e) {
                      Period.weekly => 'week',
                      Period.monthly => 'month',
                      Period.quarterly => 'quarter',
                      Period.yearly => 'year',
                      _ => '${period.inDays} days',
                    }.sentenceCase,
                  ),
                ),
              )
              .toList(),
      selected: period,
      onSelectionChanged:
          (final d) =>
              const UpdatePredictionConfigCommand().onSelectedPeriodChanged(d),
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
        DailyBudgetDisplay(),
        Gap(32),
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [BudgetWillLast(), TodaysBudget()],
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

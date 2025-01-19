import 'package:mobile_app/common_imports.dart';

class SchedulePeriodSwitcher extends StatelessWidget {
  const SchedulePeriodSwitcher({
    required this.value,
    required this.onValueChanged,
    super.key,
  });

  final Period value;
  final ValueChanged<Period> onValueChanged;

  @override
  Widget build(final BuildContext context) =>
      CupertinoSlidingSegmentedControl<int>(
        children: {
          // TODO(arenukvern): add localization l10n
          Period.daily.inDays: const Text('Daily'),
          Period.weekly.inDays: const Text('Weekly'),
          Period.monthly.inDays: const Text('Monthly'),
          Period.yearly.inDays: const Text('Yearly'),
        },
        groupValue: value.inDays,
        onValueChanged: (final newValue) {
          if (newValue == null) return;
          onValueChanged(Period(newValue));
        },
      );
}

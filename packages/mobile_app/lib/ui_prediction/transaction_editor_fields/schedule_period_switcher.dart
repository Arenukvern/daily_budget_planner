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
  Widget build(final BuildContext context) => CupertinoSlidingSegmentedControl(
        children: const {
          // TODO(arenukvern): add localization l10n
          Period.daily: Text('Daily'),
          Period.weekly: Text('Weekly'),
          Period.monthly: Text('Monthly'),
          Period.yearly: Text('Yearly'),
        },
        groupValue: value,
        onValueChanged: (final newValue) {
          if (newValue == null) return;
          onValueChanged(newValue);
        },
      );
}

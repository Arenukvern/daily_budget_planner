import 'package:mobile_app/common_imports.dart';

class DatetimeField extends StatelessWidget {
  const DatetimeField({
    required this.date,
    required this.onChanged,
    super.key,
  });
  final DateTime date;
  final ValueSetter<DateTime> onChanged;
  @override
  Widget build(final BuildContext context) {
    final use24HourFormat = context.select<AppSettingsNotifier, bool>(
      (final s) => s.settings.use24HourFormat,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: UiDateTimeField(
        initialValue: date,
        use24HourFormat: use24HourFormat,
        onChanged: onChanged,
      ),
    );
  }
}

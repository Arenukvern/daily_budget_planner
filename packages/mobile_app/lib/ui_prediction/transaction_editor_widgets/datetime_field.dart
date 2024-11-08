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
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: UiDateTimeField(
          initialValue: date,
          onChanged: onChanged,
        ),
      );
}

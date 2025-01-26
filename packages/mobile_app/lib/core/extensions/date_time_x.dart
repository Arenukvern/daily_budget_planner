import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';

extension DateTimeX on DateTime {
  String format({final String pattern = 'dd/MM/yyyy', final String? locale}) {
    if (locale != null && locale.isNotEmpty) {
      Intl.defaultLocale = 'en_EN';
    }
    return DateFormat(pattern, locale).format(this);
  }

  String formatDdMmYyyy() => toLocal().format(pattern: 'dd.MM.yyyy');

  /// Returns a new [DateTime] instance with the same date but time
  /// set to midnight.
  ///
  /// This is useful for comparing dates without considering the time component.
  ///
  /// Example:
  /// ```dart
  /// final dateTime = DateTime(2023, 5, 15, 14, 30);
  /// final dateOnly = dateTime.withoutTime; // DateTime(2023, 5, 15, 0, 0, 0, 0)
  /// ```
  DateTime get toDayBeginning => DateTime(year, month, day);
  DateTime get toDayEnd => toDayBeginning.add(1.days).subtract(1.seconds);

  /// Returns true if the date is today.
  bool get isToday => isSameDay(DateTime.now());

  /// Returns true if the date is the same day as the other date.
  bool isSameDay(final DateTime other) =>
      toDayBeginning == other.toDayBeginning;
  DateTime addPeriod(final Period period) => add(period.duration);
}

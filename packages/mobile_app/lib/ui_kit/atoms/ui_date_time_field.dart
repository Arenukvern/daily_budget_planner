import 'package:intl/intl.dart';
import 'package:mobile_app/common_imports.dart';

class UiDateTimeField extends StatefulWidget {
  const UiDateTimeField({
    required this.initialValue,
    required this.onChanged,
    this.use24HourFormat = false,
    this.arePickersEnabled = false,
    super.key,
  });

  final DateTime initialValue;
  final bool arePickersEnabled;
  final bool use24HourFormat;
  final ValueChanged<DateTime> onChanged;

  @override
  State<UiDateTimeField> createState() => _UiDateTimeFieldState();
}

enum _UiDateTimeFieldMode {
  date,
  time,
  none,
}

class _UiDateTimeFieldState extends State<UiDateTimeField> {
  late DateTime _selectedDateTime;
  late TextEditingController _timeController;
  _UiDateTimeFieldMode _mobilePickerMode = _UiDateTimeFieldMode.none;

  // Add these constants at the top of the class
  static final DateTime _minDate = DateTime(2000);
  static final DateTime _maxDate =
      DateTime.now().add(const Duration(days: 365 * 2));

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.initialValue;
    _timeController = TextEditingController(
      text: (widget.use24HourFormat ? DateFormat.Hm() : DateFormat.jm())
          .format(_selectedDateTime),
    );
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final context, final constraints) {
          // TODO(arenukvern): integrate pickers as alternative to buttons
          if (widget.arePickersEnabled) {
            return Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async => _showDatePicker(context),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        // TODO(arenukvern): add localization l10n
                        labelText: 'Date',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      child: Text(DateFormat.yMMMd().format(_selectedDateTime)),
                    ),
                  ),
                ),
                Gap(16),
                Expanded(
                  child: InkWell(
                    onTap: () async => _showTimePicker(
                      context,
                      use24HourFormat: widget.use24HourFormat,
                    ),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        // TODO(arenukvern): add localization l10n
                        labelText: 'Time',
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      child: Text(
                        widget.use24HourFormat
                            ? DateFormat.Hm().format(_selectedDateTime)
                            : DateFormat.jm().format(_selectedDateTime),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Mobile layout
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InputFieldDecorator(
                        // TODO(arenukvern): add localization l10n
                        labelText: 'Date',
                        value: DateFormat.yMMMd().format(_selectedDateTime),
                        icon: Icons.calendar_today,
                        onTap: () => setState(
                          () {
                            if (_mobilePickerMode
                                case _UiDateTimeFieldMode.date) {
                              _mobilePickerMode = _UiDateTimeFieldMode.none;
                            } else {
                              _mobilePickerMode = _UiDateTimeFieldMode.date;
                            }
                          },
                        ),
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: InputFieldDecorator(
                        // TODO(arenukvern): add localization l10n
                        labelText: 'Time',
                        value: widget.use24HourFormat
                            ? DateFormat.Hm().format(_selectedDateTime)
                            : DateFormat.jm().format(_selectedDateTime),
                        icon: Icons.access_time,
                        onTap: () => setState(
                          () {
                            if (_mobilePickerMode
                                case _UiDateTimeFieldMode.time) {
                              _mobilePickerMode = _UiDateTimeFieldMode.none;
                            } else {
                              _mobilePickerMode = _UiDateTimeFieldMode.time;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                if (_mobilePickerMode != _UiDateTimeFieldMode.none)
                  SizedBox(
                    height: 216,
                    child: CupertinoDatePicker(
                      key: ValueKey(_mobilePickerMode),
                      minimumDate: _minDate,
                      maximumDate: _maxDate,
                      mode: switch (_mobilePickerMode) {
                        _UiDateTimeFieldMode.date =>
                          CupertinoDatePickerMode.date,
                        _UiDateTimeFieldMode.time =>
                          CupertinoDatePickerMode.time,
                        _ => throw UnsupportedError(
                            'Unsupported picker mode: $_mobilePickerMode',
                          ),
                      },
                      initialDateTime: _selectedDateTime,
                      use24hFormat: widget.use24HourFormat,
                      onDateTimeChanged: (final newDateTime) {
                        if (newDateTime.compareTo(_minDate) < 0 ||
                            newDateTime.compareTo(_maxDate) > 0) {
                          return;
                        }
                        _selectedDateTime = switch (_mobilePickerMode) {
                          _UiDateTimeFieldMode.date => DateTime(
                              newDateTime.year,
                              newDateTime.month,
                              newDateTime.day,
                              _selectedDateTime.hour,
                              _selectedDateTime.minute,
                            ),
                          _UiDateTimeFieldMode.time => DateTime(
                              _selectedDateTime.year,
                              _selectedDateTime.month,
                              _selectedDateTime.day,
                              newDateTime.hour,
                              newDateTime.minute,
                            ),
                          _ => _selectedDateTime, // Fallback case
                        };
                        setState(() {});
                        widget.onChanged(_selectedDateTime);
                      },
                    ),
                  ),
              ],
            );
          }
        },
      );

  Future<void> _showDatePicker(final BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: _minDate,
      lastDate: _maxDate,
    );
    if (picked != null && picked != _selectedDateTime) {
      setState(() {
        _selectedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          _selectedDateTime.hour,
          _selectedDateTime.minute,
        );
      });
      widget.onChanged(_selectedDateTime);
    }
  }

  Future<void> _showTimePicker(
    final BuildContext context, {
    required final bool use24HourFormat,
  }) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (final context, final child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(alwaysUse24HourFormat: use24HourFormat),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        _selectedDateTime = DateTime(
          _selectedDateTime.year,
          _selectedDateTime.month,
          _selectedDateTime.day,
          picked.hour,
          picked.minute,
        );
        _timeController.text =
            (use24HourFormat ? DateFormat.Hm() : DateFormat.jm())
                .format(_selectedDateTime);
      });
      widget.onChanged(_selectedDateTime);
    }
  }
}

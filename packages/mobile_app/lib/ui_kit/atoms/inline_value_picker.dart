import 'package:mobile_app/common_imports.dart';

/// {@template inline_value_picker}
/// A horizontal inline picker that allows users to select a value from a list.
/// Supports both swipe gestures and arrow button navigation.
///
/// Example usage:
/// ```dart
/// InlineValuePicker<String>(
///   values: ['plan ahead', 'save money', 'budget wisely'],
///   initialIndex: 0,
///   onIndexChanged: (index) => print('Selected: ${values[index]}'),
/// )
/// ```
/// {@endtemplate}
class InlineValuePicker<T> extends StatefulWidget {
  /// {@macro inline_value_picker}
  const InlineValuePicker({
    required this.values,
    required this.onIndexChanged,
    required this.initialIndex,
    super.key,
  });

  /// The list of values to pick from.
  final List<T> values;

  /// The initial index to display.
  final int initialIndex;

  /// Callback when the selected index changes.
  final ValueChanged<int> onIndexChanged;

  @override
  State<InlineValuePicker<T>> createState() => _InlineValuePickerState<T>();
}

class _InlineValuePickerState<T> extends State<InlineValuePicker<T>> {
  late int _currentIndex = widget.initialIndex;

  void _nextValue() {
    if (_currentIndex < widget.values.length - 1) {
      setState(() {
        _currentIndex++;
      });
      widget.onIndexChanged(_currentIndex);
    }
  }

  void _previousValue() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      widget.onIndexChanged(_currentIndex);
    }
  }

  @override
  Widget build(final BuildContext context) => Semantics(
    label: 'Value picker',
    value: widget.values[_currentIndex].toString(),
    increasedValue:
        _currentIndex < widget.values.length - 1
            ? widget.values[_currentIndex + 1].toString()
            : null,
    decreasedValue:
        _currentIndex > 0 ? widget.values[_currentIndex - 1].toString() : null,
    onIncrease: _currentIndex < widget.values.length - 1 ? _nextValue : null,
    onDecrease: _currentIndex > 0 ? _previousValue : null,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Left arrow button
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 18,
            color:
                _currentIndex > 0
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.onPrimary.withOpacity(0.3),
          ),
          onPressed: _currentIndex > 0 ? _previousValue : null,
          splashRadius: 16,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 30),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          tooltip: 'Previous value',
        ),

        // Current value with swipe detection and fixed animation
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onHorizontalDragEnd: (final details) {
                if (details.primaryVelocity == null) return;

                if (details.primaryVelocity! > 0) {
                  // Swiped right to left
                  _previousValue();
                } else if (details.primaryVelocity! < 0) {
                  // Swiped left to right
                  _nextValue();
                }
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeOutBack,
                switchOutCurve: Curves.easeInBack,
                transitionBuilder: (final child, final animation) {
                  // Create a combined scale and fade transition
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: animation, child: child),
                  );
                },
                child: DefaultTextStyle.merge(
                  key: ValueKey<int>(_currentIndex),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                  child: Text(
                    widget.values[_currentIndex].toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),

        // Right arrow button
        IconButton(
          icon: Icon(
            Icons.chevron_right,
            size: 18,
            color:
                _currentIndex < widget.values.length - 1
                    ? context.colorScheme.onPrimary
                    : context.colorScheme.onPrimary.withOpacity(0.3),
          ),
          onPressed:
              _currentIndex < widget.values.length - 1 ? _nextValue : null,
          splashRadius: 16,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 30),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          tooltip: 'Next value',
        ),
      ],
    ),
  );
}

import 'package:mobile_app/common_imports.dart';

// TODO(arenukvern): refactor to use CupertinoSegmentedControl
/// A segmented button widget that follows iOS-style design
class UiSegmentedButton<T> extends StatelessWidget {
  const UiSegmentedButton({
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
    this.isEnabled = true,
    super.key,
  });

  final List<ButtonSegment<T>> segments;
  final T selected;
  final ValueChanged<T> onSelectionChanged;
  final bool isEnabled;

  @override
  Widget build(final BuildContext context) => SegmentedButton<T>(
        segments: segments,
        selected: {selected},
        onSelectionChanged: (final newSelection) {
          onSelectionChanged(newSelection.first);
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (final states) {
              if (states.contains(WidgetState.selected)) {
                return context.colorScheme.primary;
              }
              return context.colorScheme.surface;
            },
          ),
          foregroundColor: WidgetStateProperty.resolveWith<Color>(
            (final states) {
              if (states.contains(WidgetState.selected)) {
                return context.colorScheme.onPrimary;
              }
              return context.colorScheme.onSurface;
            },
          ),
          side: WidgetStateProperty.all(
            BorderSide(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      );
}

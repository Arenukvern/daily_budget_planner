import 'package:mobile_app/common_imports.dart';
import 'package:xsoulspace_ui_foundation/xsoulspace_ui_foundation.dart';

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
    showSelectedIcon: false,

    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textStyle: WidgetStateProperty.all(context.textTheme.labelMedium),
      backgroundColor: WidgetStateProperty.resolveWith<Color>((final states) {
        if (states.contains(WidgetState.selected)) {
          return context.colorScheme.primaryContainer;
        }
        return context.colorScheme.primary;
      }),
      foregroundColor: WidgetStateProperty.resolveWith<Color>((final states) {
        if (states.contains(WidgetState.selected)) {
          return context.colorScheme.onPrimaryContainer;
        }
        return context.colorScheme.onPrimary;
      }),
      side: WidgetStateProperty.all(
        BorderSide(color: context.colorScheme.primaryFixedDim),
      ),
    ),
  );
}

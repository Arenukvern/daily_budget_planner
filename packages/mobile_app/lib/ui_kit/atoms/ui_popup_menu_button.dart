import 'package:mobile_app/common_imports.dart';

/// A popup menu button that follows the app's design system
class UiPopupMenuButton<T> extends StatelessWidget {
  const UiPopupMenuButton({
    required this.itemBuilder,
    required this.onSelected,
    required this.child,
    this.initialValue,
    this.tooltip,
    super.key,
  });

  final PopupMenuItemBuilder<T> itemBuilder;
  final PopupMenuItemSelected<T> onSelected;
  final Widget child;
  final T? initialValue;
  final String? tooltip;

  @override
  Widget build(final BuildContext context) => PopupMenuButton<T>(
        initialValue: initialValue,
        tooltip: tooltip,
        onSelected: onSelected,
        itemBuilder: itemBuilder,
        position: PopupMenuPosition.under,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: child,
        ),
      );
}

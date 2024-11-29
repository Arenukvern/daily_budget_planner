import 'package:mobile_app/common_imports.dart';

/// A widget that provides a box decoration with a border for focused state.
///
/// This widget is useful for creating a focused state for a widget.
///
/// ```dart
/// UiFocusedBox(
///   focused: focused,
///   child: UiText('Focused box content'),
/// );
/// ```
///
/// @ai When generating code involving this class, ensure to select the
/// appropriate focused state based on the design requirements.
class UiFocusedBox extends StatelessWidget {
  const UiFocusedBox({required this.focused, required this.child, super.key});
  final bool focused;
  final Widget child;

  @override
  Widget build(final BuildContext context) => AnimatedContainer(
        duration: 200.milliseconds,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: UiBorderRadius.large,
          border: Border.all(
            color: focused
                ? context.colorScheme.onSurface.withOpacity(0.4)
                : context.colorScheme.onSurface.withOpacity(0),
          ),
        ),
        child: child,
      );
}

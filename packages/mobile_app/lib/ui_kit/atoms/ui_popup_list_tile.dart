import 'package:mobile_app/common_imports.dart';
import 'package:xsoulspace_ui_foundation/xsoulspace_ui_foundation.dart';

/// {@template ui_popup_list_tile}
/// A consistent list tile widget designed for popup menus.
///
/// Features:
/// - Leading icon
/// - Title text
/// - Loading state with progress indicator
/// - Trailing chevron icon (when not loading)
/// - Scale animation on loading state
/// - Ink ripple effect
/// - Consistent padding and styling
///
/// Usage:
/// ```dart
/// UiPopupListTile(
///   onTap: () => print('Tapped'),
///   title: 'Settings',
///   icon: Icons.settings,
///   isLoading: false,
/// )
/// ```
/// {@endtemplate}
class UiPopupListTile extends StatelessWidget {
  /// {@macro ui_popup_list_tile}
  const UiPopupListTile({
    required this.onTap,
    required this.title,
    this.iconData,
    this.icon,
    this.isLoading = false,
    this.isSelected = false,
    super.key,
  });

  /// Callback when the tile is tapped
  final VoidCallback onTap;

  /// The title text to display
  final String title;

  /// The leading icon to display
  final IconData? iconData;

  /// The leading icon to display
  final Widget? icon;

  /// Whether to show a loading indicator instead of the chevron
  final bool isLoading;

  /// Whether the tile is selected
  final bool isSelected;

  @override
  Widget build(final BuildContext context) {
    final menuController = context.read<UiPopupButton>();
    final scaleDirection = menuController.scaleDirection;

    return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: DefaultTextStyle(
                style: context.textTheme.bodyLarge!.copyWith(
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurface,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                child: Row(
                  children: [
                    if (icon != null || iconData != null) ...[
                      icon ??
                          Icon(
                            iconData,
                            size: 20,
                            color: context.colorScheme.onSurface.withOpacity(
                              0.8,
                            ),
                          ),
                      const Gap(12),
                    ],
                    Expanded(child: Text(title)),
                    const Gap(16),
                    if (isLoading)
                      const UiCircularProgress.uncentered()
                    else if (isSelected)
                      Icon(
                        Icons.check,
                        size: 18,
                        color: context.colorScheme.primary,
                      )
                    else
                      Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: context.colorScheme.onSurface.withOpacity(0.5),
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
        .animate(target: isLoading ? 0.95 : 1.0)
        .scaleY(
          duration: 100.milliseconds,
          end: scaleDirection == UiPopupButtonScaleDirection.up ? 0.95 : 1.0,
          begin: scaleDirection == UiPopupButtonScaleDirection.up ? 1.0 : 0.95,
        );
  }
}

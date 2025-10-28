import 'dart:ui';

import 'package:mobile_app/common_imports.dart';
import 'package:xsoulspace_ui_foundation/xsoulspace_ui_foundation.dart';

/// {@template ui_popup_decoration}
/// A reusable widget that provides a consistent popup decoration with
/// glassmorphism effect across the app.
///
/// Features:
/// - Glassmorphism effect with blur
/// - Consistent card styling
/// - Customizable max width
/// - Fade and scale animations
/// {@endtemplate}
class UiPopupDecoration extends StatelessWidget {
  /// {@macro ui_popup_decoration}
  const UiPopupDecoration({
    required this.child,
    this.maxWidth = 270,
    this.borderRadius = 16,
    this.blurSigma = 8,
    this.surfaceOpacity = 0.85,
    super.key,
  });

  /// The child widget to be displayed inside the popup decoration
  final Widget child;

  /// Maximum width constraint for the popup
  final double maxWidth;

  /// Border radius for the popup corners
  final double borderRadius;

  /// Blur sigma value for the glassmorphism effect
  final double blurSigma;

  /// Opacity of the surface color
  final double surfaceOpacity;

  @override
  Widget build(final BuildContext context) {
    final scaleDirection = context.read<UiPopupButton>().scaleDirection;
    return Card(
          elevation: 0,
          color: context.colorScheme.surface.withOpacity(surfaceOpacity),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: child,
              ),
            ),
          ),
        )
        .animate()
        .slideY(
          begin: scaleDirection == UiPopupButtonScaleDirection.up ? 0.1 : -0.1,
          duration: 200.milliseconds,
          curve: Curves.easeOutExpo,
        )
        .scale(
          begin: const Offset(0.95, 0.95),
          duration: 200.milliseconds,
          curve: Curves.easeOutExpo,
        );
  }
}

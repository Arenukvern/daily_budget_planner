import 'package:mobile_app/common_imports.dart';

typedef UiPopupButtonController = ({
  bool isPopupVisible,
  MenuController menuController,
  VoidCallback close,
  VoidCallback open,
});

UiPopupButtonController useUiPopupButtonController() {
  final isPopupVisible = useState(false);
  final menuController = useMemoized(MenuController.new);

  return (
    close: () {
      isPopupVisible.value = false;
      menuController.close();
    },
    open: () {
      isPopupVisible.value = true;
      menuController.open();
    },
    isPopupVisible: isPopupVisible.value,
    menuController: menuController,
  );
}

/// {@template ui_popup_button}
/// A reusable button widget that shows a popup menu with consistent styling
/// and animations.
///
/// Features:
/// - Built-in state management for popup visibility
/// - Consistent menu styling
/// - Optional rotation animation on button press
/// - Fade animation for menu items
/// {@endtemplate}
class UiPopupButton extends HookWidget {
  /// {@macro ui_popup_button}
  const UiPopupButton({
    required this.menuBuilder,
    required this.buttonBuilder,
    required this.controller,
    this.shouldRotate = true,
    super.key,
  });

  /// Builder for the menu content
  final WidgetBuilder menuBuilder;

  /// Controller for the popup button
  final UiPopupButtonController controller;

  /// Builder for the button that triggers the menu
  final Widget Function(
    BuildContext context,
    bool isPopupVisible,
    VoidCallback onPressed,
  ) buttonBuilder;

  /// Whether to apply rotation animation to the button when menu is open
  final bool shouldRotate;

  @override
  Widget build(final BuildContext context) {
    Widget buildButton() {
      final isPopupVisible = controller.isPopupVisible;
      final button = buttonBuilder(
        context,
        controller.isPopupVisible,
        isPopupVisible ? controller.close : controller.open,
      );

      return shouldRotate
          ? button
              .animate(
                target: isPopupVisible ? 1 : 0,
              )
              .rotate(
                duration: 200.milliseconds,
                curve: Curves.easeOutExpo,
                begin: 0,
                end: 0.125,
              )
          : button;
    }

    return MenuAnchor(
      controller: controller.menuController,
      consumeOutsideTap: true,
      onClose: controller.close,
      style: MenuStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
      ),
      menuChildren: [
        Builder(
          builder: menuBuilder,
        ).animate().fade(duration: 50.milliseconds),
      ],
      builder: (final context, final controller, final child) => buildButton(),
    );
  }
}

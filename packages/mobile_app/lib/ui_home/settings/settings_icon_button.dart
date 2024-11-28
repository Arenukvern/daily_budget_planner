import 'package:flutter_portal/flutter_portal.dart';
import 'package:life_hooks/life_hooks.dart';
import 'package:mobile_app/common_imports.dart';
import 'package:mobile_app/ui_home/settings/settings_bottom_dialog.dart';

class SettingsIconButton extends HookWidget {
  const SettingsIconButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final isPopupVisible = useIsBool();
    void onClose() => isPopupVisible.value = false;
    // TODO(arenukvern): remove portal since it's not rebuilding
    // when size of view is changed
    return PortalTarget(
      visible: isPopupVisible.value,
      portalFollower: _Barrier(onClose: onClose),
      child: PortalTarget(
        visible: isPopupVisible.value,
        portalFollower: SettingsBottomPopup(
          onClose: onClose,
        ).animate().fade(
              duration: 50.milliseconds,
            ),
        anchor: const Aligned(
          follower: Alignment.bottomRight,
          target: Alignment.topRight,
        ),
        child: IconButton(
          onPressed: () {
            isPopupVisible.value = true;
          },
          icon: const Icon(Icons.settings),
        ),
      ),
    );
  }
}

class _Barrier extends HookWidget {
  const _Barrier({required this.onClose, super.key});
  final VoidCallback onClose;

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onVerticalDragStart: (final details) => onClose(),
        onHorizontalDragStart: (final details) => onClose(),
        child: ModalBarrier(
          color: context.colorScheme.shadow.withOpacity(0.1),
          onDismiss: onClose,
        ).animate().fade(duration: 40.milliseconds),
      );
}

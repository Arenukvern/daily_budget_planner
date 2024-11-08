import 'package:mobile_app/common_imports.dart';

class UiBottomSheetScaffold extends StatelessWidget {
  const UiBottomSheetScaffold({
    required this.body,
    required this.bottomBar,
    required this.onPopInvoked,
    super.key,
  });
  final Widget body;
  final Widget bottomBar;
  final VoidCallback onPopInvoked;

  @override
  Widget build(final BuildContext context) {
    const sheetShape = ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );

    return SafeArea(
      bottom: false,
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (final didPop, final result) async {
          if (didPop) return;
          return onPopInvoked();
        },
        child: SheetKeyboardDismissible(
          dismissBehavior: const SheetKeyboardDismissBehavior.onDragDown(
            isContentScrollAware: true,
          ),
          child: ScrollableSheet(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: sheetShape,
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: SheetContentScaffold(
                resizeBehavior: const ResizeScaffoldBehavior.avoidBottomInset(
                  // Make the bottom bar visible when the keyboard is open.
                  maintainBottomBar: true,
                ),
                body: body,
                bottomBar: StickyBottomBarVisibility(
                  child: bottomBar,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

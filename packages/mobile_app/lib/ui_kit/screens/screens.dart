import 'package:mobile_app/common_imports.dart';
import 'package:xsoulspace_ui_foundation/xsoulspace_ui_foundation.dart';

export 'markdown_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(final BuildContext context) => Directionality(
    textDirection: TextDirection.ltr,
    child: Container(
      alignment: Alignment.center,
      color: AppThemeData.brandDark.colorScheme.surface,
      child: const UiCircularProgress(),
    ),
  );
}

class UiCircularProgress extends StatelessWidget {
  const UiCircularProgress({super.key}) : centered = true;
  const UiCircularProgress.uncentered({super.key}) : centered = false;
  final bool centered;
  @override
  Widget build(final BuildContext context) {
    final child = CupertinoActivityIndicator(
      color: Theme.of(context).brightness == Brightness.dark
          ? context.colorScheme.onPrimary
          : context.colorScheme.primary,
    );
    return centered ? Center(child: child) : child;
  }
}

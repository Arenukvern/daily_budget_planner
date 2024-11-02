import 'package:mobile_app/common_imports.dart';

class UiBottomActionBar extends StatelessWidget {
  const UiBottomActionBar({
    required this.children,
    this.margin,
    super.key,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(final BuildContext context) => SafeArea(
        top: false,
        child: Hero(
          tag: 'bottom-action-bar',
          child: UiBottomActionBarDecorator(
            margin: margin,
            children: children,
          ),
        ),
      );
}

class UiBottomActionBarDecorator extends StatelessWidget {
  const UiBottomActionBarDecorator({
    required this.children,
    this.margin,
    super.key,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          color: context.colorScheme.surface,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: context.colorScheme.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            ),
          ),
        ),
      );
}

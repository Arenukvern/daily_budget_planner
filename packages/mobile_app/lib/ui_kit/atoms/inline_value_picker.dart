import 'package:mobile_app/common_imports.dart';

class InlineValuePicker<T> extends StatefulWidget {
  const InlineValuePicker({
    required this.values,
    required this.onIndexChanged,
    required this.initialIndex,
    super.key,
  });
  final List<T> values;
  final int initialIndex;
  final ValueChanged<int> onIndexChanged;

  @override
  State<InlineValuePicker<T>> createState() => _InlineValuePickerState<T>();
}

class _InlineValuePickerState<T> extends State<InlineValuePicker<T>> {
  late final _scrollController = FixedExtentScrollController(
    initialItem: widget.initialIndex,
  );

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => SizedBox(
    height: 30,
    child: CupertinoPicker.builder(
      itemExtent: 30,
      // diameterRatio: 0.4,
      onSelectedItemChanged: widget.onIndexChanged,
      childCount: widget.values.length,
      scrollController: _scrollController,
      itemBuilder:
          (final context, final index) => Align(
            alignment: Alignment.centerLeft,
            child: DefaultTextStyle.merge(
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colorScheme.onPrimary,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(widget.values[index].toString()),
              ),
            ),
          ),
    ),
  );
}

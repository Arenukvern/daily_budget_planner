import 'package:mobile_app/common_imports.dart';

Future<Task?> showTaskEditor(
  final BuildContext context, {
  required final Task? task,
}) =>
    Navigator.push(
      context,
      ModalSheetRoute(
        swipeDismissible: true,
        builder: (final context) => _TaskEditor(
          task: task,
        ),
      ),
    );

class _TaskEditor extends StatefulHookWidget {
  const _TaskEditor({required this.task});

  final Task? task;

  @override
  State<_TaskEditor> createState() => _TaskEditorState();
}

class _TaskEditorState extends State<_TaskEditor> {
  @override
  Widget build(final BuildContext context) => const Placeholder();
}

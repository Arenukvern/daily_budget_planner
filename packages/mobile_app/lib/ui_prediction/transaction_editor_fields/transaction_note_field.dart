import 'package:mobile_app/common_imports.dart';

class TransactionNoteField extends StatelessWidget {
  const TransactionNoteField({
    required this.note,
    required this.onChanged,
    super.key,
  });

  final String note;
  final void Function(String) onChanged;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: UiTextField(
          decoration: InputDecoration(
            labelText: 'Notes (Optional)',
          ),
          value: note,
          onChanged: onChanged,
        ),
      );
}

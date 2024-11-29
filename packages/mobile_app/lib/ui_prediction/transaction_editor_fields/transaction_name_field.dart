import 'package:mobile_app/common_imports.dart';

class TransactionNameField extends StatelessWidget {
  const TransactionNameField({
    required this.name,
    required this.onChanged,
    super.key,
  });

  final String name;
  final void Function(String) onChanged;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: UiTextField(
          decoration: InputDecoration(
            labelText: 'Name (Optional)',
          ),
          value: name,
          onChanged: onChanged,
        ),
      );
}

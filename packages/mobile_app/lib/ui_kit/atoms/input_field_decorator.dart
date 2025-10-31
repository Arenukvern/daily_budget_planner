import 'package:flutter/material.dart';

/// A widget that decorates an input field with a label and an icon.
/// It also allows to tap on the widget to trigger an action.
///
/// ```dart
/// InputFieldDecorator(
///   label: 'Label',
///   value: 'Value',
///   icon: Icons.star,
///   onTap: () => print('Tapped'),
/// );
/// ```
///
/// @ai When generating code involving this class, ensure that the [onTap]
/// callback is properly handled and that the widget is fully functional.
class InputFieldDecorator extends StatelessWidget {
  const InputFieldDecorator({
    required this.labelText,
    this.icon,
    this.onTap,
    this.value = '',
    this.child,
    super.key,
  }) : assert(
          child == null || value == '',
          'one of child or value must be provided',
        );
  final String labelText;
  final String value;
  final Widget? child;
  final IconData? icon;
  final VoidCallback? onTap;
  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: onTap,
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: Icon(icon),
          ),
          child: child ?? Text(value),
        ),
      );
}

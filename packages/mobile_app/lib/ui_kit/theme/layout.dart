import 'package:mobile_app/common_imports.dart';

class UiLayout {
  UiLayout.fromConstraints(this.constraints);
  final BoxConstraints constraints;

  bool get isDesktop => constraints.maxWidth > 600;
}

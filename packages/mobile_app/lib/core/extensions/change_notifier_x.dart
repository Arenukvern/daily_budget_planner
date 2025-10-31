import 'package:mobile_app/common_imports.dart';

extension AppChangeNotifierX on ChangeNotifier {
  void setState(final VoidCallback fn) {
    fn();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    notifyListeners();
  }
}

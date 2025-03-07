import 'package:mobile_app/common_imports.dart';

enum AppStatus {
  offline,
  online,
  loading;
}

@stateDistributor
class AppStatusResource extends ValueNotifier<AppStatus> {
  AppStatusResource() : super(AppStatus.loading);
}

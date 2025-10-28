import 'package:mobile_app/di/di.dart';
import 'package:xsoulspace_installation_store/xsoulspace_installation_store.dart';

class LoadStoreCmd with HasResources, HasNotifiers {
  const LoadStoreCmd();

  Future<void> execute() async {
    final source = await const InstallationStoreUtils().getInstallationSource();
    installationStoreResource.value = source;
  }
}

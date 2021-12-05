import 'package:mobile_registry/feature/home/ui/home/controller/home_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class HomeFeatureDependencies {
  HomeFeatureDependencies() {
    _registerController();
  }

  void _registerController() {
    sl.registerFactory<HomeController>(
      () => HomeController(),
    );
  }
}

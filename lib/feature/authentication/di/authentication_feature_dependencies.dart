import 'package:mobile_registry/feature/authentication/ui/login/controller/login_controller.dart';
import 'package:mobile_registry/feature/authentication/ui/splash/controller/splash_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class AuthenticationFeatureDependencies {
  AuthenticationFeatureDependencies() {
    _registerController();
  }

  void _registerController() {
    sl.registerFactory<SplashController>(
      () => SplashController(),
    );
    sl.registerFactory<LoginController>(
          () => LoginController(),
    );
  }
}

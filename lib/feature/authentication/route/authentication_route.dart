import 'package:get/get.dart';
import 'package:mobile_registry/feature/authentication/ui/login/page/login_page.dart';
import 'package:mobile_registry/feature/authentication/ui/splash/page/splash_page.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

List<GetPage> authenticationRoute() {
  return [
    GetPage(
      name: Constants.reRoute.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Constants.reRoute.login,
      page: () => const LoginPage(),
    ),
  ];
}
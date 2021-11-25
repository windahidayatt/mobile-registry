import 'package:get/get.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

class SplashController extends GetxController {
  void checkSession(){
    Future.delayed(const Duration(seconds: 3), () {
      _navigateToLoginPage();
    });
  }

  void _navigateToLoginPage(){
    Get.offAndToNamed(Constants.reRoute.login);
  }
}

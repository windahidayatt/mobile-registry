import 'package:get/get.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/get_token_usecase.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

class SplashController extends GetxController {
  final GetTokenUseCase getTokenUseCase;
  SplashController({required this.getTokenUseCase});

  void checkSession(){
    Future.delayed(const Duration(seconds: 3), () {
      _getToken();
    });
  }

  void _getToken() async {
    var result = await getTokenUseCase.call(NoParams());
    result.fold((l) {
      _navigateToLoginPage();
    }, (r) {
      _navigateToHomePage();
    });
  }

  void _navigateToLoginPage(){
    Get.offAndToNamed(Constants.reRoute.login);
  }

  void _navigateToHomePage(){
    Get.offAndToNamed(Constants.reRoute.home);
  }
}

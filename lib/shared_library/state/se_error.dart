import 'package:get/get.dart';
class SEError {
  static show({required String error}){
    Get.snackbar(
      "Error",
      error,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
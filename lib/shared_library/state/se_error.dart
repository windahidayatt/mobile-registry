import 'package:get/get.dart';
class SEError {
  static show({required String error}){
    Get.snackbar(
      "Info",
      error,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
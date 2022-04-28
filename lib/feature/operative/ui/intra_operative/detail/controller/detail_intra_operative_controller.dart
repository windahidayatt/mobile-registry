import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DetailPreOperativeController extends GetxController {
  RxBool isEditable = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController medicalRecordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController diagnosisController = TextEditingController();
  TextEditingController managementController = TextEditingController();
}
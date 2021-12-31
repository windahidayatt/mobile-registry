import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddPreOperativeController extends GetxController {
  TextEditingController patientController = TextEditingController();
  TextEditingController forwardFlexionController = TextEditingController();
  TextEditingController abductionController = TextEditingController();
  TextEditingController externalRotationNeutralController = TextEditingController();
  TextEditingController externalRotationAbductionController = TextEditingController();
  TextEditingController internalRotationController = TextEditingController();
  TextEditingController americanScoreController = TextEditingController();
  TextEditingController dashScoreController = TextEditingController();
  TextEditingController actionPlanController = TextEditingController();
  TextEditingController plannedDateController = TextEditingController();
  String operativeType = '';
  int vasScore = 0;
  Rx<String> plannedDate = ''.obs;
  late Rx<bool> isSupportingInvestigation, billingByBPJS, anesthesia, complete;
  late Rx<File> americanShoulderScore, xRay, ctScan, mri;
}
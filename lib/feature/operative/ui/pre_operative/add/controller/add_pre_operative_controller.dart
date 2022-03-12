import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_patients.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/add_pre_operative_usecase.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_pre_patients_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPreOperativeController extends GetxController {
  AddPreOperativeController(
      {required this.getPrePatientsUseCase,
      required this.addPreOperativeUseCase});
  final GetPrePatientsUseCase getPrePatientsUseCase;
  final AddPreOperativeUseCase addPreOperativeUseCase;
  final List<PrePatients> listPatients = [];
  final Rx<ViewState> viewState = ViewState.initial().obs;

  TextEditingController patientController = TextEditingController();
  TextEditingController forwardFlexionController = TextEditingController();
  TextEditingController abductionController = TextEditingController();
  TextEditingController externalRotationNeutralController =
      TextEditingController();
  TextEditingController externalRotationAbductionController =
      TextEditingController();
  TextEditingController internalRotationController = TextEditingController();
  TextEditingController americanScoreController = TextEditingController();
  TextEditingController dashScoreController = TextEditingController();
  TextEditingController actionPlanController = TextEditingController();
  TextEditingController plannedDateController = TextEditingController();
  String patientIdentity = '';
  String operativeType = '';
  int vasScore = 0;
  Rx<String> plannedDate = ''.obs;
  late Rx<bool> isSupportingInvestigation, billingByBPJS, anesthesia, complete;
  late Rx<File> americanShoulderScore, xRay, ctScan, mri;

  void getPrePatients() {
    _getPrePatients();
  }

  void _getPrePatients() async {
    viewState(ViewState.loading());
    Either<Failure, List<PrePatients>> result =
        await getPrePatientsUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      listPatients.clear();
      listPatients.addAll(r);
    });
  }

  void addPreOperative() async {
    Either<Failure, bool> result =
        await addPreOperativeUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      print(l.message.toString());
    }, (r) {
      print(r.toString());
    });
  }
}

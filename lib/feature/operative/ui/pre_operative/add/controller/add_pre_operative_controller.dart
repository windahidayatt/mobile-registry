import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_patients.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/add_pre_operative_usecase.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_pre_patients_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPreOperativeController extends GetxController {
  AddPreOperativeController({
    required this.getPrePatientsUseCase,
    required this.addPreOperativeUseCase,
  });
  final GetPrePatientsUseCase getPrePatientsUseCase;
  final AddPreOperativeUseCase addPreOperativeUseCase;

  final Rx<ViewState> viewState = ViewState.initial().obs;

  // Options value in Dropdown
  final List<PrePatients> listPatients = [];
  final List<String> listTypes = ['Shoulder', 'Elbow'];

  // Text Controller
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
  TextEditingController vasScoreController = TextEditingController();
  TextEditingController progressBillingController = TextEditingController();

  // Dropdown
  Rx<String> patientIdentity = ''.obs;
  Rx<String> operativeType = ''.obs;
  Rx<String> plannedDate = ''.obs;

  // Main Switch
  final Rx<bool> isSupportingInvestigation = false.obs;
  final Rx<bool> billingByBPJS = false.obs;
  final Rx<bool> anesthesia = false.obs;
  final Rx<bool> complete = false.obs;

  // Optional Switch for Shoulder
  final Rx<bool> shoulderNeer = false.obs;
  final Rx<bool> shoulderJobe = false.obs;
  final Rx<bool> shoulderHawkins = false.obs;
  final Rx<bool> externalRotationLag = false.obs;
  final Rx<bool> hornblower = false.obs;
  final Rx<bool> bellyPress = false.obs;
  final Rx<bool> bellyOff = false.obs;
  final Rx<bool> liftOff = false.obs;
  final Rx<bool> bearHug = false.obs;
  final Rx<bool> obrient = false.obs;
  final Rx<bool> throwing = false.obs;
  final Rx<bool> speed = false.obs;
  final Rx<bool> anteriorApprehension = false.obs;
  final Rx<bool> posteriorApprehension = false.obs;
  final Rx<bool> loadShift = false.obs;
  final Rx<bool> sulcusSign = false.obs;
  final Rx<bool> posteriorJerk = false.obs;

  // Documents
  final Rxn<PlatformFile> americanShoulderScore = Rxn<PlatformFile>();
  final Rxn<PlatformFile> xRay = Rxn<PlatformFile>();
  final Rxn<PlatformFile> ctScan = Rxn<PlatformFile>();
  final Rxn<PlatformFile> mri = Rxn<PlatformFile>();

  // Multiple Documents
  final RxList<PlatformFile> forwardFlexionImages = <PlatformFile>[].obs;
  final RxList<PlatformFile> abductionDegreeImages = <PlatformFile>[].obs;
  final RxList<PlatformFile> externalRotationNeutralImages =
      <PlatformFile>[].obs;
  final RxList<PlatformFile> externalRotation90AbductionImages =
      <PlatformFile>[].obs;
  final RxList<PlatformFile> internalRotationImages = <PlatformFile>[].obs;

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
      viewState(
        ViewState.error(
          l.message.toString(),
        ),
      );
    }, (r) {
      viewState(
        ViewState.completed(r),
      );
      listPatients.clear();
      listPatients.addAll(r);
    });
  }

  String _getBooleanStringify(bool isTrue) => (isTrue == true) ? "1" : "0";

  void addPreOperative() async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await addPreOperativeUseCase.call(
      AddPreOperativeParams(
        patient: patientIdentity.value,
        type: operativeType.value,
        vasScore: vasScoreController.text,
        forwardFlexion: forwardFlexionController.text,
        abductionDegree: abductionController.text,
        externalRotationNeutral: externalRotationNeutralController.text,
        externalRotation90Abduction: externalRotationAbductionController.text,
        internalRotation: internalRotationController.text,
        asesScore: americanScoreController.text,
        dashScore: dashScoreController.text,
        actionPlan: actionPlanController.text,
        plannedDate: plannedDate.toString(),
        progessSupportInvestigation:
            _getBooleanStringify(isSupportingInvestigation.value),
        progessBpjsBilling: _getBooleanStringify(billingByBPJS.value),
        progressBilling: progressBillingController.text,
        progessAnesthesia: _getBooleanStringify(anesthesia.value),
        progessComplete: _getBooleanStringify(complete.value),
        shoulderSpecialTestForm:
            (operativeType.value == 'Shoulder') ? "1" : "0",
        shoulerNeer: _getBooleanStringify(shoulderNeer.value),
        shoulerJobe: _getBooleanStringify(shoulderJobe.value),
        shoulerHawkins: _getBooleanStringify(shoulderHawkins.value),
        extRotationLag: _getBooleanStringify(externalRotationLag.value),
        hornblower: _getBooleanStringify(hornblower.value),
        bellyPress: _getBooleanStringify(bellyPress.value),
        bellyOff: _getBooleanStringify(bellyOff.value),
        liftOff: _getBooleanStringify(liftOff.value),
        bearHug: _getBooleanStringify(bearHug.value),
        obrient: _getBooleanStringify(obrient.value),
        throwing: _getBooleanStringify(throwing.value),
        speed: _getBooleanStringify(speed.value),
        anteriorApprehension: _getBooleanStringify(anteriorApprehension.value),
        posteriorApprehension:
            _getBooleanStringify(posteriorApprehension.value),
        loadShift: _getBooleanStringify(loadShift.value),
        sulcusSign: _getBooleanStringify(sulcusSign.value),
        posteriorJerk: _getBooleanStringify(posteriorJerk.value),
        asesScoreFile: americanShoulderScore.value?.path,
        xRayFile: xRay.value?.path,
        ctScanFile: ctScan.value?.path,
        mriFile: mri.value?.path,
        forwardFlexionImages:
            forwardFlexionImages.map((element) => element.path ?? '').toList(),
        abductionDegreeImages:
            forwardFlexionImages.map((element) => element.path ?? '').toList(),
        externalRotationNeutralImages: externalRotationNeutralImages
            .map((element) => element.path ?? '')
            .toList(),
        externalRotation90AbductionImages: externalRotation90AbductionImages
            .map((element) => element.path ?? '')
            .toList(),
        internalRotationImages: internalRotationImages
            .map((element) => element.path ?? '')
            .toList(),
      ),
    );
    result.fold((l) {
      viewState(
        ViewState.error(
          l.message.toString(),
        ),
      );
    }, (r) {
      viewState(
        ViewState.completed(r),
      );
      getPrePatients();
    });
  }
}

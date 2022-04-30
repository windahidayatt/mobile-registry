import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_patients.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/add_intra_operative_usecase.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_intra_patients_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddIntraOperativeController extends GetxController {
  AddIntraOperativeController({
    required this.getIntraPatientsUseCase,
    required this.addIntraOperativeUseCase,
  });
  final GetIntraPatientsUseCase getIntraPatientsUseCase;
  final AddIntraOperativeUseCase addIntraOperativeUseCase;

  final Rx<ViewState> viewState = ViewState.initial().obs;

  // Options value in Dropdown
  final List<IntraPatients> listPatients = [];
  final List<String> listDomainManagement = [
    "Open Reduction Internal Fixation",
    "Pain Intervention",
    "Shoulder Arthroplasty",
    "Shoulder Arthroscopy",
    "Soft Tissue Reconstruction"
  ];
  final List<String> listShoulderArthroplastyProcedure = [
    "Hemi Shoulder Arthroplasty",
    "Total Shoulder Arthroplasty",
    "Reverse Shoulder Arthroplasty"
  ];

  // Text Controller
  TextEditingController anthroscopyOpenController = TextEditingController();
  TextEditingController humeralHeadSizeController = TextEditingController();
  TextEditingController humeralStemSizeController = TextEditingController();
  TextEditingController glenosphereSizeController = TextEditingController();
  TextEditingController actionPlanController = TextEditingController();

  // Dropdown
  Rx<String> patientIdentity = ''.obs;
  Rx<String> domainManagement = ''.obs;
  Rx<String> shoulderArthroplastyProcedure = ''.obs;
  Rx<String> plannedDate = ''.obs;

  // Main Switch
  final Rx<bool> isSupportingInvestigation = false.obs;
  final Rx<bool> billingByBPJS = false.obs;
  final Rx<bool> anesthesia = false.obs;
  final Rx<bool> complete = false.obs;

  // Optional Switch for Intervention
  final Rx<bool> subacromialInjection = false.obs;
  final Rx<bool> glenohumeralInjection = false.obs;
  final Rx<bool> acJointInjection = false.obs;
  final Rx<bool> suprascapularNotch = false.obs;
  final Rx<bool> spinoglenoidNotch = false.obs;
  final Rx<bool> longAxisBg = false.obs;
  final Rx<bool> shortAxisBg = false.obs;
  final Rx<bool> rotatorInterval = false.obs;
  final Rx<bool> guidedInjection = false.obs;
  final Rx<bool> anatomicalLandmarkInjection = false.obs;
  final Rx<bool> piOther = false.obs;

  // Optional Switch for Shoulder Arthroscopy
  final Rx<bool> lhbtTenotomy = false.obs;
  final Rx<bool> lhbtTenodesis = false.obs;
  final Rx<bool> subacromialDecompressionBursectomy = false.obs;
  final Rx<bool> acromioplasty = false.obs;
  final Rx<bool> partialRotatorCuffRepair = false.obs;
  final Rx<bool> rotatorCuffRepair = false.obs;
  final Rx<bool> superiorCapsularReconstruction = false.obs;
  final Rx<bool> bankartRepair = false.obs;
  final Rx<bool> bonyBankartRepair = false.obs;
  final Rx<bool> capsuleLabrumPlasty = false.obs;
  final Rx<bool> acJointResection = false.obs;
  final Rx<bool> suprascapularNerveRelease = false.obs;
  final Rx<bool> axillaryNerveRelease = false.obs;
  final Rx<bool> arthroscopyLatarjetProcedure = false.obs;
  final Rx<bool> saOther = false.obs;

  // Optional Switch for Internal Fixation
  final Rx<bool> magnusonStack = false.obs;
  final Rx<bool> ortOther = false.obs;

  void getIntraPatients() {
    _getIntraPatients();
  }

  void _getIntraPatients() async {
    viewState(ViewState.loading());
    Either<Failure, List<IntraPatients>> result =
        await getIntraPatientsUseCase.call(
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

  void addIntraOperative() async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await addIntraOperativeUseCase.call(
      AddIntraOperativeParams(
        patient: patientIdentity.value,
        domainManagement: domainManagement.value,
        anthroscopyOpenReduction: anthroscopyOpenController.text,
        humeralHeadSize: humeralHeadSizeController.text,
        humeralStemSize: humeralStemSizeController.text,
        glenosphereSize: glenosphereSizeController.text,
        actionPlan: actionPlanController.text,
        plannedDate: plannedDate.value,
        progessSupportInvestigation:
            _getBooleanStringify(isSupportingInvestigation.value),
        progessBpjsBilling: _getBooleanStringify(billingByBPJS.value),
        progessAnesthesia: _getBooleanStringify(anesthesia.value),
        progessComplete: _getBooleanStringify(complete.value),
        subacromialInjection: _getBooleanStringify(subacromialInjection.value),
        glenohumeralInjection:
            _getBooleanStringify(glenohumeralInjection.value),
        acJointInjection: _getBooleanStringify(acJointInjection.value),
        sphSuprascapularNotch: _getBooleanStringify(suprascapularNotch.value),
        sphSpinoglenoidNotch: _getBooleanStringify(spinoglenoidNotch.value),
        lhbtLongAxisBg: _getBooleanStringify(longAxisBg.value),
        lhbtShortAxisBg: _getBooleanStringify(shortAxisBg.value),
        lhbtRotatorInterval: _getBooleanStringify(rotatorInterval.value),
        usgGuidedInjection: _getBooleanStringify(guidedInjection.value),
        anatomicalLandmarkInjection:
            _getBooleanStringify(anatomicalLandmarkInjection.value),
        piOther: _getBooleanStringify(piOther.value),
        lhbtTenotomy: _getBooleanStringify(lhbtTenotomy.value),
        lhbtTenodesis: _getBooleanStringify(lhbtTenodesis.value),
        subacromialDecompressionBursectomy:
            _getBooleanStringify(subacromialDecompressionBursectomy.value),
        acromioplasty: _getBooleanStringify(acromioplasty.value),
        partialRotatorCuffRepair:
            _getBooleanStringify(partialRotatorCuffRepair.value),
        rotatorCuffRepair: _getBooleanStringify(rotatorCuffRepair.value),
        superiorCapsularReconstruction:
            _getBooleanStringify(superiorCapsularReconstruction.value),
        bankartRepair: _getBooleanStringify(bankartRepair.value),
        bonyBankartRepair: _getBooleanStringify(bonyBankartRepair.value),
        capsuleLabrumPlasty: _getBooleanStringify(capsuleLabrumPlasty.value),
        acJointResection: _getBooleanStringify(acJointResection.value),
        suprascapularNerveRelease:
            _getBooleanStringify(suprascapularNerveRelease.value),
        axillaryNerveRelease: _getBooleanStringify(axillaryNerveRelease.value),
        arthroscopyLatarjetProcedure:
            _getBooleanStringify(arthroscopyLatarjetProcedure.value),
        saOther: _getBooleanStringify(saOther.value),
        magnusonStack: _getBooleanStringify(magnusonStack.value),
        ortOther: _getBooleanStringify(ortOther.value),
        shoulderArthroplastyProcedure: shoulderArthroplastyProcedure.value,
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
      getIntraPatients();
    });
  }
}

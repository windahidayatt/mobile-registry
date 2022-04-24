import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/domain_case.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/add_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_domain_case_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPatientController extends GetxController {
  AddPatientController({
    required this.getDomainCaseUseCase,
    required this.addPatientUseCase,
  });

  final AddPatientUseCase addPatientUseCase;
  final GetDomainCaseUseCase getDomainCaseUseCase;
  final Rx<ViewState> viewState = ViewState.initial().obs;
  final List<DomainCase> listDomainCase = [];
  final List<String> listDomainManagement = [
    "Open Reduction Internal Fixation",
    "Pain Intervention",
    "Shoulder Arthroplasty",
    "Shoulder Arthroscopy",
    "Soft Tissue Reconstruction"
  ];
  final List<String> listGender = ["Female", "Male"];
  final List<String> listHospital = [
    "RSUP Dr. Hasan Sadikin",
    "RS Santosa Central",
    "RSKB Halmahera Siaga"
  ];

  String? domainCase, domainManagement, gender, hospital;
  TextEditingController nameText = TextEditingController();
  TextEditingController ageText = TextEditingController();
  TextEditingController weightText = TextEditingController();
  TextEditingController heightText = TextEditingController();
  TextEditingController medicalRecordText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController diagnosticText = TextEditingController();
  TextEditingController managementText = TextEditingController();

  void getDomainCase() async {
    viewState(ViewState.loading());
    Either<Failure, List<DomainCase>> result = await getDomainCaseUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      listDomainCase.clear();
      listDomainCase.addAll(r);
    });
  }

  void addPatient() async {
    Either<Failure, bool> result = await addPatientUseCase.call(
      AddPatientParams(
          domainCase: domainCase,
          domainManagement: domainManagement,
          name: nameText.text,
          age: ageText.text,
          gender: gender,
          weight: weightText.text,
          height: heightText.text,
          hospital: hospital,
          medicalRecord: medicalRecordText.text,
          phoneNumber: phoneText.text,
          diagnosis: diagnosticText.text,
          management: managementText.text),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
    });
  }
}

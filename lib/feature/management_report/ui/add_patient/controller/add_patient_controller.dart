import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/domain_case.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/hospital.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/add_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/edit_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_detail_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_domain_case_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_hospitals_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPatientController extends GetxController {
  AddPatientController({
    required this.getDomainCaseUseCase,
    required this.addPatientUseCase,
    required this.getHospitalsUseCase,
    required this.getDetailPatientUseCase,
    required this.editPatientUseCase,
  });

  final EditPatientUseCase editPatientUseCase;
  final GetDetailPatientUseCase getDetailPatientUseCase;
  final GetHospitalsUseCase getHospitalsUseCase;
  final AddPatientUseCase addPatientUseCase;
  final GetDomainCaseUseCase getDomainCaseUseCase;
  final Rx<ViewState> viewState = ViewState.initial().obs;
  final List<DomainCase> listDomainCase = [];
  final List<Hospital> listHospital = [];
  late final Patient patient;
  final List<String> listDomainManagement = [
    "Open Reduction Internal Fixation",
    "Pain Intervention",
    "Shoulder Arthroplasty",
    "Shoulder Arthroscopy",
    "Soft Tissue Reconstruction"
  ];
  final List<String> listGender = ["Female", "Male"];

  String? domainCase, domainManagement, gender, hospital;
  TextEditingController nameText = TextEditingController();
  TextEditingController ageText = TextEditingController();
  TextEditingController weightText = TextEditingController();
  TextEditingController heightText = TextEditingController();
  TextEditingController medicalRecordText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController diagnosticText = TextEditingController();
  TextEditingController managementText = TextEditingController();

  void _autoFillFormPatient(Patient patient) {
    domainCase = patient.id.toString();
    hospital = patient.hospitalId.toString();
    domainManagement = patient.domainManagement;
    nameText.text = patient.name ?? '-';
    ageText.text = patient.age.toString();
    gender = patient.gender ?? '-';
    weightText.text = patient.weight.toString();
    heightText.text = patient.height.toString();
    medicalRecordText.text = patient.medicalRecord ?? '-';
    phoneText.text = patient.phoneNumber ?? '-';
    diagnosticText.text = patient.diagnosis ?? '-';
    managementText.text = patient.management ?? '-';
  }

  void getDetailPatient(String id) async {
    viewState(ViewState.loading());
    Either<Failure, Patient> result = await getDetailPatientUseCase.call(
      id,
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      patient = r;
      _autoFillFormPatient(r);
    });
  }

  void getHospitals() async {
    viewState(ViewState.loading());
    Either<Failure, List<Hospital>> result = await getHospitalsUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      listHospital.clear();
      listHospital.addAll(r);
    });
  }

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
    viewState(ViewState.loading());
    Either<Failure, bool> result = await addPatientUseCase.call(
      AddPatientParams(
          domainCaseId: domainCase,
          domainManagement: domainManagement,
          name: nameText.text,
          age: ageText.text,
          gender: gender,
          weight: weightText.text,
          height: heightText.text,
          hospitalId: hospital,
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

  void editPatient(String id) async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await editPatientUseCase.call(
      EditPatientParams(
          id: id,
          domainCaseId: domainCase,
          domainManagement: domainManagement,
          name: nameText.text,
          age: ageText.text,
          gender: gender,
          weight: weightText.text,
          height: heightText.text,
          hospitalId: hospital,
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

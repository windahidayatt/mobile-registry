import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/delete_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_patients_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class PatientDataController extends GetxController {
  final GetPatientsUseCase getPatientsUseCase;
  final DeletePatientUseCase deletePatientUseCase;
  final List<Patient> listPatient = [];
  PatientDataController({
    required this.getPatientsUseCase,
    required this.deletePatientUseCase,
  });

  final Rx<ViewState> viewState = ViewState.initial().obs;
  Future<void> getPatientsData() async {
    await _getPatientsData();
  }

  Future<void> _getPatientsData() async {
    viewState(ViewState.loading());
    Either<Failure, List<Patient>> result = await getPatientsUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      listPatient.clear();
      listPatient.addAll(r);
    });
  }

  void deletePatientsData(String id) async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await deletePatientUseCase.call(id);
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      getPatientsData();
    });
  }
}

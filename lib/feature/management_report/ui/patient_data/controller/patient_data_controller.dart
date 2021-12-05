import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_patients_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class PatientDataController extends GetxController {
  final GetPatientsUseCase getPatientsUseCase;
  final List<Patient> listPatient = [];
  PatientDataController({required this.getPatientsUseCase});

  final Rx<ViewState> viewState = ViewState.initial().obs;
  void getPatientsData() {
    _getPatientsData();
  }

  void _getPatientsData() async {
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
}

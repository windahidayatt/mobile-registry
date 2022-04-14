import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/domain_case.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_domain_case_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPatientController extends GetxController {
  AddPatientController({required this.getDomainCaseUseCase});

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

  void getDomainCase() async {
    viewState(ViewState.loading());
    Either<Failure, List<DomainCase>> result =
    await getDomainCaseUseCase.call(
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
}

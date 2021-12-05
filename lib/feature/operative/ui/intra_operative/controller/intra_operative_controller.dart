import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_intra_operatives_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class IntraOperativeController extends GetxController {
  final GetIntraOperativesUseCase getIntraOperativesUseCase;
  final List<IntraOperative> listIntraOperative = [];
  IntraOperativeController({required this.getIntraOperativesUseCase});
  final Rx<ViewState> viewState = ViewState.initial().obs;
  void getIntraOperativesData() {
    _getIntraOperativesData();
  }

  void _getIntraOperativesData() async {
    viewState(ViewState.loading());
    Either<Failure, List<IntraOperative>> result =
    await getIntraOperativesUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      listIntraOperative.clear();
      listIntraOperative.addAll(r);
    });
  }
}
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_pre_operatives_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class PreOperativeController extends GetxController {
  final GetPreOperativesUseCase getPreOperativesUseCase;
  final List<PreOperative> listPreOperative = [];
  PreOperativeController({required this.getPreOperativesUseCase});
  final Rx<ViewState> viewState = ViewState.initial().obs;
  void getPreOperativesData() {
    _getPreOperativesData();
  }

  void _getPreOperativesData() async {
    viewState(ViewState.loading());
    Either<Failure, List<PreOperative>> result =
        await getPreOperativesUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      listPreOperative.clear();
      listPreOperative.addAll(r);
    });
  }
}

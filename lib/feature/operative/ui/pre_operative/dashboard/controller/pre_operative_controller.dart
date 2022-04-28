import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/delete_pre_operative_usecase.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_pre_operatives_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class PreOperativeController extends GetxController {
  final GetPreOperativesUseCase getPreOperativesUseCase;
  final DeletePreOperativeUseCase deletePreOperativeUseCase;
  final List<PreOperative> listPreOperative = [];
  PreOperativeController({
    required this.getPreOperativesUseCase,
    required this.deletePreOperativeUseCase,
  });
  final Rx<ViewState> viewState = ViewState.initial().obs;
  Future<void> getPreOperativesData() async {
    _getPreOperativesData();
  }

  Future<void> _getPreOperativesData() async {
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

  void deletePreOperativeData(String id) async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await deletePreOperativeUseCase.call(id);
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      getPreOperativesData();
    });
  }
}

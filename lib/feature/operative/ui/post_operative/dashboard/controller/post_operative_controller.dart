import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/delete_post_operative_usecase.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_post_operatives_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class PostOperativeController extends GetxController {
  final GetPostOperativesUseCase getPostOperativesUseCase;
  final DeletePostOperativeUseCase deletePostOperativeUseCase;
  final List<PostOperative> listPostOperative = [];
  PostOperativeController({
    required this.getPostOperativesUseCase,
    required this.deletePostOperativeUseCase,
  });
  final Rx<ViewState> viewState = ViewState.initial().obs;

  Future<void> getPostOperativesData() async {
    _getPostOperativesData();
  }

  void _getPostOperativesData() async {
    viewState(ViewState.loading());
    Either<Failure, List<PostOperative>> result =
        await getPostOperativesUseCase.call(
      NoParams(),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      listPostOperative.clear();
      listPostOperative.addAll(r);
    });
  }

  void deletePostOperativeData(String id) async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await deletePostOperativeUseCase.call(id);
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      getPostOperativesData();
    });
  }
}

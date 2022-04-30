import 'package:mobile_registry/feature/operative/ui/intra_operative/add/controller/add_intra_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/dashboard/controller/intra_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/dashboard/controller/post_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/add/controller/add_pre_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/dashboard/controller/pre_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/detail/controller/detail_pre_operative_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class OperativeFeatureDependencies {
  OperativeFeatureDependencies() {
    _registerController();
  }

  void _registerController() {
    sl.registerFactory<PreOperativeController>(
      () => PreOperativeController(
        deletePreOperativeUseCase: sl(),
        getPreOperativesUseCase: sl(),
      ),
    );
    sl.registerFactory<PostOperativeController>(
      () => PostOperativeController(
        deletePostOperativeUseCase: sl(),
        getPostOperativesUseCase: sl(),
      ),
    );
    sl.registerFactory<IntraOperativeController>(
      () => IntraOperativeController(
        deleteIntraOperativeUseCase: sl(),
        getIntraOperativesUseCase: sl(),
      ),
    );
    sl.registerFactory<AddPreOperativeController>(
      () => AddPreOperativeController(
        getPrePatientsUseCase: sl(),
        addPreOperativeUseCase: sl(),
      ),
    );
    sl.registerFactory<DetailPreOperativeController>(
      () => DetailPreOperativeController(),
    );
    sl.registerFactory<AddIntraOperativeController>(
      () => AddIntraOperativeController(
        getIntraPatientsUseCase: sl(),
        addIntraOperativeUseCase: sl(),
      ),
    );
  }
}

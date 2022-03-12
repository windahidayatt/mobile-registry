import 'package:mobile_registry/feature/operative/ui/intra_operative/controller/intra_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/controller/post_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/add/controller/add_pre_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/dashboard/controller/pre_operative_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class OperativeFeatureDependencies {
  OperativeFeatureDependencies() {
    _registerController();
  }

  void _registerController() {
    sl.registerFactory<PreOperativeController>(
      () => PreOperativeController(
        getPreOperativesUseCase: sl(),
      ),
    );
    sl.registerFactory<PostOperativeController>(
      () => PostOperativeController(
        getPostOperativesUseCase: sl(),
      ),
    );
    sl.registerFactory<IntraOperativeController>(
      () => IntraOperativeController(
        getIntraOperativesUseCase: sl(),
      ),
    );
    sl.registerFactory<AddPreOperativeController>(
      () => AddPreOperativeController(
        getPrePatientsUseCase: sl(),
        addPreOperativeUseCase: sl(),
      ),
    );
  }
}

import 'package:mobile_registry/feature/operative/ui/intra_operative/controller/intra_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/controller/post_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/controller/pre_operative_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class OperativeFeatureDependencies {
  OperativeFeatureDependencies() {
    _registerController();
  }

  void _registerController() {
    sl.registerFactory<PreOperativeController>(
      () => PreOperativeController(),
    );
    sl.registerFactory<PostOperativeController>(
      () => PostOperativeController(),
    );
    sl.registerFactory<IntraOperativeController>(
      () => IntraOperativeController(),
    );
  }
}

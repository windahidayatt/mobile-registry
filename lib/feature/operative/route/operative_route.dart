import 'package:get/get.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/add/page/add_pre_operative_page.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';
List<GetPage> operativeRoute() {
  return [
    GetPage(
      name: Constants.reRoute.addPreOperative,
      page: () => const AddPreOperativePage(),
    ),
  ];
}
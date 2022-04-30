import 'package:get/get.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/add/page/add_intra_operative_page.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/add/page/add_pre_operative_page.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

List<GetPage> operativeRoute() {
  return [
    GetPage(
      name: Constants.reRoute.addPreOperative,
      page: () => const AddPreOperativePage(),
    ),
    GetPage(
      name: Constants.reRoute.addIntraOperative,
      page: () => const AddIntraOperativePage(),
    ),
  ];
}

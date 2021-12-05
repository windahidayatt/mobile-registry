import 'package:get/get.dart';
import 'package:mobile_registry/feature/home/ui/home/page/home_page.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';
List<GetPage> homeRoute() {
  return [
    GetPage(
      name: Constants.reRoute.home,
      page: () => const HomePage(),
    ),
  ];
}
import 'package:get/get.dart';
import 'package:mobile_registry/feature/management_report/ui/add_patient/page/add_patient_page.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/add/page/add_pre_operative_page.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';
List<GetPage> managementReportRoute() {
  return [
    GetPage(
      name: Constants.reRoute.addPatient,
      page: () => const AddPatientPage(),
    ),
  ];
}
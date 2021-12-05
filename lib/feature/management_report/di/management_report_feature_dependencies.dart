import 'package:mobile_registry/feature/management_report/ui/detail_patient/controller/detail_patient_controller.dart';
import 'package:mobile_registry/feature/management_report/ui/patient_data/controller/patient_data_controller.dart';
import 'package:mobile_registry/feature/management_report/ui/report/controller/report_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class ManagementReportFeatureDependencies {
  ManagementReportFeatureDependencies() {
    _registerController();
  }

  void _registerController() {
    sl.registerFactory<ReportController>(
      () => ReportController(),
    );
    sl.registerFactory<PatientDataController>(
      () => PatientDataController(getPatientsUseCase: sl()),
    );
    sl.registerFactory<DetailPatientController>(
      () => DetailPatientController(),
    );
  }
}

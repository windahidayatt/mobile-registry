import 'package:mobile_registry/feature/management_report/ui/add_patient/controller/add_patient_controller.dart';
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
      () => PatientDataController(
        deletePatientUseCase: sl(),
        getPatientsUseCase: sl(),
      ),
    );
    sl.registerFactory<DetailPatientController>(
      () => DetailPatientController(),
    );
    sl.registerFactory<AddPatientController>(
      () => AddPatientController(
        getDetailPatientUseCase: sl(),
        getHospitalsUseCase: sl(),
        getDomainCaseUseCase: sl(),
        addPatientUseCase: sl(),
        editPatientUseCase: sl(),
      ),
    );
  }
}

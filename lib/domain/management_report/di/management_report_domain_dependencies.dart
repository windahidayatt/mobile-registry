import 'package:mobile_registry/domain/management_report/data/datasources/management_report_local_datasource.dart';
import 'package:mobile_registry/domain/management_report/data/datasources/management_report_remote_datasource.dart';
import 'package:mobile_registry/domain/management_report/data/repositories/management_report_repository_impl.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/add_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/delete_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/edit_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_detail_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/get_patients_usecase.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class ManagementReportDomainDependencies {
  ManagementReportDomainDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
  }

  void _registerUseCase() {
    sl.registerLazySingleton<AddPatientUseCase>(
      () => AddPatientUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<DeletePatientUseCase>(
      () => DeletePatientUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<EditPatientUseCase>(
      () => EditPatientUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<GetDetailPatientUseCase>(
      () => GetDetailPatientUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<GetPatientsUseCase>(
      () => GetPatientsUseCase(
        sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<ManagementReportRepository>(
      () => ManagementReportRepositoryImpl(
        remoteDatasource: sl(),
        localDatasource: sl(),
      ),
    );
  }

  void _registerDataSource() {
    sl.registerLazySingleton<ManagementReportRemoteDatasource>(
      () => ManagementReportRemoteDatasource(
        httpHandler: sl(),
      ),
    );
    sl.registerLazySingleton<ManagementReportLocalDatasource>(
      () => ManagementReportLocalDatasource(
        sharedPreferences: sl(),
      ),
    );
  }
}

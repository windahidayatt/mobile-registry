import 'package:mobile_registry/domain/operative/data/datasources/operative_local_datasource.dart';
import 'package:mobile_registry/domain/operative/data/datasources/operative_remote_datasource.dart';
import 'package:mobile_registry/domain/operative/data/repositories/operative_repository_impl.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_intra_operatives_usecase.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/get_pre_operatives_usecase.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class OperativeDomainDependencies {
  OperativeDomainDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
  }

  void _registerUseCase() {
    sl.registerLazySingleton<GetPreOperativesUseCase>(
      () => GetPreOperativesUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetIntraOperativesUseCase>(
      () => GetIntraOperativesUseCase(
        sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<OperativeRepository>(
      () => OperativeRepositoryImpl(
        remoteDatasource: sl(),
        localDatasource: sl(),
      ),
    );
  }

  void _registerDataSource() {
    sl.registerLazySingleton<OperativeRemoteDatasource>(
      () => OperativeRemoteDatasource(
        httpHandler: sl(),
      ),
    );
    sl.registerLazySingleton<OperativeLocalDatasource>(
      () => OperativeLocalDatasource(
        sharedPreferences: sl(),
      ),
    );
  }
}

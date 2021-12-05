import 'package:mobile_registry/domain/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:mobile_registry/domain/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:mobile_registry/domain/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:mobile_registry/domain/authentication/domain/repositories/authentication_repository.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/get_token_usecase.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/login_usecase.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/logout_usecase.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class AuthenticationDomainDependencies {
  AuthenticationDomainDependencies() {
    _registerUseCase();
    _registerRepository();
    _registerDataSource();
  }

  void _registerUseCase() {
    sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(
        sl(),
      ),
    );

    sl.registerLazySingleton<GetTokenUseCase>(
      () => GetTokenUseCase(
        sl(),
      ),
    );
  }

  void _registerRepository() {
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        remoteDatasource: sl(),
        localDatasource: sl(),
      ),
    );
  }

  void _registerDataSource() {
    sl.registerLazySingleton<AuthenticationRemoteDatasource>(
      () => AuthenticationRemoteDatasource(client: sl()),
    );
    sl.registerLazySingleton<AuthenticationLocalDatasource>(
      () => AuthenticationLocalDatasource(
        sharedPreferences: sl(),
      ),
    );
  }
}

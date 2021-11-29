import 'package:mobile_registry/domain/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:mobile_registry/domain/authentication/domain/repositories/authentication_repository.dart';
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
  }

  void _registerRepository() {
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(),
    );
  }

  void _registerDataSource() {}
}

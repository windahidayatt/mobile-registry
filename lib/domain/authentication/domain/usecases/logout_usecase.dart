import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/authentication/domain/repositories/authentication_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class LogoutUseCase extends UseCase<bool, NoParams> {
  final AuthenticationRepository _repository;
  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return _repository.logout(params);
  }
}
import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/authentication/domain/repositories/authentication_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetTokenUseCase extends UseCase<String, NoParams> {
  final AuthenticationRepository _repository;
  GetTokenUseCase(this._repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return _repository.getToken(params);
  }
}

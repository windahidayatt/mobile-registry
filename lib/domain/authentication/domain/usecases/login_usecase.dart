import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/authentication/domain/entities/result_login.dart';
import 'package:mobile_registry/domain/authentication/domain/repositories/authentication_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class LoginUseCase extends UseCase<ResultLogin, LoginParams> {
  final AuthenticationRepository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, ResultLogin>> call(LoginParams params) {
    return _repository.login(params);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
    email, password
  ];
}

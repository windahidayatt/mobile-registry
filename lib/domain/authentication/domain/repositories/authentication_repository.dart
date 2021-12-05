import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/login_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> logout(NoParams params);
  Future<Either<Failure, bool>> login(LoginParams params);
  Future<Either<Failure, String>> getToken(NoParams params);
}
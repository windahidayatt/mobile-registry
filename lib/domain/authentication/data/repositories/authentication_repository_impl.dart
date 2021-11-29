import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/authentication/domain/entities/result_login.dart';
import 'package:mobile_registry/domain/authentication/domain/repositories/authentication_repository.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/login_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<Either<Failure, ResultLogin>> login(LoginParams params) async {
    try {
      return const Left(GeneralFailure(message: 'Sukses'));
    } catch(e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout(NoParams params) {
    // TODO: implement logout
    throw UnimplementedError();
  }

}
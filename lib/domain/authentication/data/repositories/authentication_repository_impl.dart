import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:mobile_registry/domain/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:mobile_registry/domain/authentication/data/models/login_response_dto.dart';
import 'package:mobile_registry/domain/authentication/domain/repositories/authentication_repository.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/login_usecase.dart';
import 'package:mobile_registry/shared_library/exception/api_exceptions.dart';
import 'package:mobile_registry/shared_library/exception/cache_exceptions.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalDatasource localDatasource;
  final AuthenticationRemoteDatasource remoteDatasource;

  AuthenticationRepositoryImpl(
      {required this.localDatasource, required this.remoteDatasource});

  @override
  Future<Either<Failure, bool>> login(LoginParams params) async {
    try {
      LoginResponseDTO result = await remoteDatasource.login(params.email, params.password);
      localDatasource.cacheToken(result.accessToken);
      return const Right(true);
    } on APIException catch (error) {
      return Left(APIFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, bool>> logout(NoParams params) async {
    try {
      await localDatasource.clearToken();
      return const Right(true);
    } on CacheException catch (error) {
      return Left(CacheFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, String>> getToken(NoParams params) async {
    try {
      String result = await localDatasource.getToken();
      return Right(result);
    } on CacheException catch (error) {
      return Left(CacheFailure(message: error.message));
    }
  }
}

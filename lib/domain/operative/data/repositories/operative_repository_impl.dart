import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/data/datasources/operative_local_datasource.dart';
import 'package:mobile_registry/domain/operative/data/datasources/operative_remote_datasource.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_patients.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/exception/api_exceptions.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class OperativeRepositoryImpl implements OperativeRepository {
  final OperativeLocalDatasource localDatasource;
  final OperativeRemoteDatasource remoteDatasource;

  OperativeRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<Either<Failure, List<PreOperative>>> getPreOperatives(
      NoParams params) async {
    try {
      var result = await remoteDatasource.getPreOperatives();
      List<PreOperative> patients = List<PreOperative>.from(
        result.map(
          (x) => PreOperative.fromDTO(x),
        ),
      );
      return Right(patients);
    } on APIException catch (error) {
      return Left(APIFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, List<IntraOperative>>> getIntraOperatives(
      NoParams params) async {
    try {
      var result = await remoteDatasource.getIntraOperatives();
      List<IntraOperative> patients = List<IntraOperative>.from(
        result.map(
          (x) => IntraOperative.fromDTO(x),
        ),
      );
      return Right(patients);
    } on APIException catch (error) {
      return Left(APIFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, List<PostOperative>>> getPostOperatives(
      NoParams params) async {
    try {
      var result = await remoteDatasource.getPostOperatives();
      List<PostOperative> patients = List<PostOperative>.from(
        result.map(
          (x) => PostOperative.fromDTO(x),
        ),
      );
      return Right(patients);
    } on APIException catch (error) {
      return Left(APIFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, List<PrePatients>>> getPrePatients(
      NoParams params) async {
    try {
      var result = await remoteDatasource.getPrePatients();
      List<PrePatients> patients = List<PrePatients>.from(
        result.map(
          (x) => PrePatients.fromDTO(x),
        ),
      );
      return Right(patients);
    } on APIException catch (error) {
      return Left(APIFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, bool>> addPreOperative(NoParams params) async {
    try {
      var result = await remoteDatasource.addPreOperative();
      return Right(result);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deletePreOperative(String params) async {
    try {
      var result = await remoteDatasource.deletePreOperative(params);
      return Right(result);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deleteIntraOperative(String params) async {
    try {
      var result = await remoteDatasource.deleteIntraOperative(params);
      return Right(result);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> deletePostOperative(String params) async {
    try {
      var result = await remoteDatasource.deletePostOperative(params);
      return Right(result);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
  }
}

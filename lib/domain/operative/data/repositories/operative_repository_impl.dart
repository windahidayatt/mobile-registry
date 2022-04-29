import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/data/datasources/operative_local_datasource.dart';
import 'package:mobile_registry/domain/operative/data/datasources/operative_remote_datasource.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_add_request_dto.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_patients.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/add_pre_operative_usecase.dart';
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
  Future<Either<Failure, bool>> addPreOperative(
      AddPreOperativeParams params) async {
    try {
      var result = await remoteDatasource.addPreOperative(
        PreOperativeAddRequestDTO(
          patient: params.patient,
          type: params.type,
          vasScore: params.vasScore,
          forwardFlexion: params.forwardFlexion,
          abductionDegree: params.abductionDegree,
          externalRotationNeutral: params.externalRotationNeutral,
          externalRotation90Abduction: params.externalRotation90Abduction,
          internalRotation: params.internalRotation,
          asesScore: params.asesScore,
          dashScore: params.dashScore,
          actionPlan: params.actionPlan,
          plannedDate: params.plannedDate,
          progessSupportInvestigation: params.progessSupportInvestigation,
          progessBpjsBilling: params.progessBpjsBilling,
          progressBilling: params.progressBilling,
          progessAnesthesia: params.progessAnesthesia,
          progessComplete: params.progessComplete,
          shoulderSpecialTestForm: params.shoulderSpecialTestForm,
          shoulerNeer: params.shoulerNeer,
          shoulerJobe: params.shoulerJobe,
          shoulerHawkins: params.shoulerHawkins,
          extRotationLag: params.extRotationLag,
          hornblower: params.hornblower,
          bellyPress: params.bellyPress,
          bellyOff: params.bellyOff,
          liftOff: params.liftOff,
          bearHug: params.bearHug,
          obrient: params.obrient,
          throwing: params.throwing,
          speed: params.speed,
          anteriorApprehension: params.anteriorApprehension,
          posteriorApprehension: params.posteriorApprehension,
          loadShift: params.loadShift,
          sulcusSign: params.sulcusSign,
          posteriorJerk: params.posteriorJerk,
          asesScoreFile: params.asesScoreFile,
          xRayFile: params.xRayFile,
          ctScanFile: params.ctScanFile,
          mriFile: params.mriFile,
        ),
      );
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

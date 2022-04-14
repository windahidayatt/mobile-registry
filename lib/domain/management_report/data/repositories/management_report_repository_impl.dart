import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/management_report/data/datasources/management_report_local_datasource.dart';
import 'package:mobile_registry/domain/management_report/data/datasources/management_report_remote_datasource.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/domain_case.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/add_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/edit_patient_usecase.dart';
import 'package:mobile_registry/shared_library/exception/api_exceptions.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class ManagementReportRepositoryImpl implements ManagementReportRepository {
  final ManagementReportLocalDatasource localDatasource;
  final ManagementReportRemoteDatasource remoteDatasource;

  ManagementReportRepositoryImpl(
      {required this.localDatasource, required this.remoteDatasource});

  @override
  Future<Either<Failure, List<Patient>>> getPatients(NoParams params) async {
    try {
      var result = await remoteDatasource.getPatients();
      List<Patient> patients = List<Patient>.from(
        result.map(
          (x) => Patient.fromDTO(x),
        ),
      );
      return Right(patients);
    } on APIException catch (error) {
      return Left(APIFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, Patient>> getDetailPatient(String params) {
    // TODO: implement getDetailPatient
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deletePatient(String params) {
    // TODO: implement deletePatient
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> editPatient(EditPatientParams params) {
    // TODO: implement editPatient
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> addPatient(AddPatientParams params) {
    // TODO: implement addPatient
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<DomainCase>>> getDomainCase(
      NoParams params) async {
    try {
      var result = await remoteDatasource.getDomainCase();
      List<DomainCase> patients = List<DomainCase>.from(
        result.map(
          (x) => DomainCase.fromDTO(x),
        ),
      );
      return Right(patients);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
  }
}

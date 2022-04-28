import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/management_report/data/datasources/management_report_local_datasource.dart';
import 'package:mobile_registry/domain/management_report/data/datasources/management_report_remote_datasource.dart';
import 'package:mobile_registry/domain/management_report/data/models/patient_add_request_dto.dart';
import 'package:mobile_registry/domain/management_report/data/models/patient_edit_request_dto.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/domain_case.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/hospital.dart';
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
  Future<Either<Failure, Patient>> getDetailPatient(String params) async {
    try {
      var result = await remoteDatasource.getPatient(params);
      Patient patients = Patient.fromDTO(result);
      return Right(patients);
    } on APIException catch (error) {
      return Left(APIFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePatient(String params) async {
    try {
      var result = await remoteDatasource.deletePatient(params);
      return Right(result);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> editPatient(EditPatientParams params) async {
    try {
      var result = await remoteDatasource.editPatient(
          PatientEditRequestDTO(
              domainCaseId: params.domainCaseId,
              domainManagement: params.domainManagement,
              name: params.name,
              age: params.age,
              gender: params.gender,
              weight: params.weight,
              height: params.height,
              hospitalId: params.hospitalId,
              medicalRecord: params.medicalRecord,
              phoneNumber: params.phoneNumber,
              diagnosis: params.diagnosis,
              management: params.management),
          params.id ?? '');
      return Right(result);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> addPatient(AddPatientParams params) async {
    try {
      var result = await remoteDatasource.addPatient(
        PatientAddRequestDTO(
            domainCaseId: params.domainCaseId,
            domainManagement: params.domainManagement,
            name: params.name,
            age: params.age,
            gender: params.gender,
            weight: params.weight,
            height: params.height,
            hospitalId: params.hospitalId,
            medicalRecord: params.medicalRecord,
            phoneNumber: params.phoneNumber,
            diagnosis: params.diagnosis,
            management: params.management),
      );
      return Right(result);
    } on APIException catch (error) {
      return Left(
        APIFailure(message: error.message),
      );
    }
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

  @override
  Future<Either<Failure, List<Hospital>>> getHospitals(NoParams params) async {
    try {
      var result = await remoteDatasource.getHospitals();
      List<Hospital> patients = List<Hospital>.from(
        result.map(
          (x) => Hospital.fromDTO(x),
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

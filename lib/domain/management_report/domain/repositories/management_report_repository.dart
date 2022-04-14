import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/domain_case.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/add_patient_usecase.dart';
import 'package:mobile_registry/domain/management_report/domain/usecases/edit_patient_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

abstract class ManagementReportRepository {
  Future<Either<Failure, List<Patient>>> getPatients(NoParams params);
  Future<Either<Failure, Patient>> getDetailPatient(String params);
  Future<Either<Failure, bool>> addPatient(AddPatientParams params);
  Future<Either<Failure, bool>> editPatient(EditPatientParams params);
  Future<Either<Failure, bool>> deletePatient(String params);
  Future<Either<Failure, List<DomainCase>>> getDomainCase(NoParams params);
}
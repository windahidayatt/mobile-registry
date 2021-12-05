import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetDetailPatientUseCase extends UseCase<Patient, String> {
  final ManagementReportRepository _repository;
  GetDetailPatientUseCase(this._repository);

  @override
  Future<Either<Failure, Patient>> call(String params) {
    return _repository.getDetailPatient(params);
  }
}
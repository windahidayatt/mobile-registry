import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class EditPatientUseCase extends UseCase<bool, EditPatientParams> {
  final ManagementReportRepository _repository;
  EditPatientUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(EditPatientParams params) {
    return _repository.editPatient(params);
  }
}

class EditPatientParams extends Equatable {
  final String? id;
  final String? domainCaseId;
  final String? domainManagement;
  final String? name;
  final String? age;
  final String? gender;
  final String? weight;
  final String? height;
  final String? hospitalId;
  final String? medicalRecord;
  final String? phoneNumber;
  final String? diagnosis;
  final String? management;

  const EditPatientParams(
      {this.id,
      this.domainCaseId,
      this.domainManagement,
      this.name,
      this.age,
      this.gender,
      this.weight,
      this.height,
      this.hospitalId,
      this.medicalRecord,
      this.phoneNumber,
      this.diagnosis,
      this.management});

  @override
  List<Object> get props => [];
}

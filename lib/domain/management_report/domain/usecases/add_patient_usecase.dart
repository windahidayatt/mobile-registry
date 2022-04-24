import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPatientUseCase extends UseCase<bool, AddPatientParams> {
  final ManagementReportRepository _repository;
  AddPatientUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(AddPatientParams params) {
    return _repository.addPatient(params);
  }
}

class AddPatientParams extends Equatable {
  final String? domainCase;
  final String? domainManagement;
  final String? name;
  final String? age;
  final String? gender;
  final String? weight;
  final String? height;
  final String? hospital;
  final String? medicalRecord;
  final String? phoneNumber;
  final String? diagnosis;
  final String? management;

  const AddPatientParams(
      {this.domainCase,
        this.domainManagement,
        this.name,
        this.age,
        this.gender,
        this.weight,
        this.height,
        this.hospital,
        this.medicalRecord,
        this.phoneNumber,
        this.diagnosis,
        this.management});

  @override
  List<Object> get props => [];
}

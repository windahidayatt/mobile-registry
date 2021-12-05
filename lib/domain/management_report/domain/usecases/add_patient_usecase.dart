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
  const AddPatientParams();
  @override
  List<Object> get props => [];
}

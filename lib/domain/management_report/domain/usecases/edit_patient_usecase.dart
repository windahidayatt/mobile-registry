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
  const EditPatientParams();
  @override
  List<Object> get props => [];
}

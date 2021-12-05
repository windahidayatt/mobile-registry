import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class DeletePatientUseCase extends UseCase<bool, String> {
  final ManagementReportRepository _repository;
  DeletePatientUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(String params) {
    return _repository.deletePatient(params);
  }
}

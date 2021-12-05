import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetPatientsUseCase extends UseCase<List<Patient>, NoParams> {
  final ManagementReportRepository _repository;
  GetPatientsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Patient>>> call(NoParams params) {
    return _repository.getPatients(params);
  }
}

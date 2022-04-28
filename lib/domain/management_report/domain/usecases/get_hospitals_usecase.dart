import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/hospital.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetHospitalsUseCase extends UseCase<List<Hospital>, NoParams> {
  final ManagementReportRepository _repository;
  GetHospitalsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Hospital>>> call(NoParams params) {
    return _repository.getHospitals(params);
  }
}

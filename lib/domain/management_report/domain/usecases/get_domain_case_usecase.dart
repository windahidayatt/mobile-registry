import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/domain_case.dart';
import 'package:mobile_registry/domain/management_report/domain/repositories/management_report_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetDomainCaseUseCase extends UseCase<List<DomainCase>, NoParams> {
  final ManagementReportRepository _repository;
  GetDomainCaseUseCase(this._repository);

  @override
  Future<Either<Failure, List<DomainCase>>> call(NoParams params) {
    return _repository.getDomainCase(params);
  }
}

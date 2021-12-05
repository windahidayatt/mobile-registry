import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetIntraOperativesUseCase extends UseCase<List<IntraOperative>, NoParams> {
  final OperativeRepository _repository;
  GetIntraOperativesUseCase(this._repository);

  @override
  Future<Either<Failure, List<IntraOperative>>> call(NoParams params) {
    return _repository.getIntraOperatives(params);
  }
}

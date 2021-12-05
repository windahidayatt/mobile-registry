import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetPreOperativesUseCase extends UseCase<List<PreOperative>, NoParams> {
  final OperativeRepository _repository;
  GetPreOperativesUseCase(this._repository);

  @override
  Future<Either<Failure, List<PreOperative>>> call(NoParams params) {
    return _repository.getPreOperatives(params);
  }
}

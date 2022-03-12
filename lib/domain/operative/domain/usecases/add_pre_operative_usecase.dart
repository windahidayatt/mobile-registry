import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPreOperativeUseCase extends UseCase<bool, NoParams> {
  final OperativeRepository _repository;
  AddPreOperativeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _repository.addPreOperative(params);
  }
}

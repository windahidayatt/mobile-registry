import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class DeletePostOperativeUseCase extends UseCase<bool, String> {
  final OperativeRepository _repository;
  DeletePostOperativeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(String params) {
    return _repository.deletePostOperative(params);
  }
}

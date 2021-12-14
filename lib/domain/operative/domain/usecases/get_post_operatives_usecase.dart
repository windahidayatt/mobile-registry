import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetPostOperativesUseCase extends UseCase<List<PostOperative>, NoParams> {
  final OperativeRepository _repository;
  GetPostOperativesUseCase(this._repository);

  @override
  Future<Either<Failure, List<PostOperative>>> call(NoParams params) {
    return _repository.getPostOperatives(params);
  }
}
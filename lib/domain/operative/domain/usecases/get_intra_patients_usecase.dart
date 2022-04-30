import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_patients.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetIntraPatientsUseCase extends UseCase<List<IntraPatients>, NoParams> {
  final OperativeRepository _repository;
  GetIntraPatientsUseCase(this._repository);

  @override
  Future<Either<Failure, List<IntraPatients>>> call(NoParams params) {
    return _repository.getIntraPatients(params);
  }
}

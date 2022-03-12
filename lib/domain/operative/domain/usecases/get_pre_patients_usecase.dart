import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_patients.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class GetPrePatientsUseCase extends UseCase<List<PrePatients>, NoParams> {
  final OperativeRepository _repository;
  GetPrePatientsUseCase(this._repository);

  @override
  Future<Either<Failure, List<PrePatients>>> call(NoParams params) {
    return _repository.getPrePatients(params);
  }
}

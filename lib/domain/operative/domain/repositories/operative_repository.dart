import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_patients.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_patients.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/add_intra_operative_usecase.dart';
import 'package:mobile_registry/domain/operative/domain/usecases/add_pre_operative_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

abstract class OperativeRepository {
  Future<Either<Failure, List<PreOperative>>> getPreOperatives(NoParams params);
  Future<Either<Failure, List<IntraOperative>>> getIntraOperatives(NoParams params);
  Future<Either<Failure, List<PostOperative>>> getPostOperatives(NoParams params);
  Future<Either<Failure, List<PrePatients>>> getPrePatients(NoParams params);
  Future<Either<Failure, List<IntraPatients>>> getIntraPatients(NoParams params);
  Future<Either<Failure, bool>> addPreOperative(AddPreOperativeParams params);
  Future<Either<Failure, bool>> addIntraOperative(AddIntraOperativeParams params);
  Future<Either<Failure, bool>> deletePreOperative(String params);
  Future<Either<Failure, bool>> deleteIntraOperative(String params);
  Future<Either<Failure, bool>> deletePostOperative(String params);
}
import 'package:dartz/dartz.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

abstract class OperativeRepository {
  Future<Either<Failure, List<PreOperative>>> getPreOperatives(NoParams params);
  Future<Either<Failure, List<IntraOperative>>> getIntraOperatives(NoParams params);
  Future<Either<Failure, List<PostOperative>>> getPostOperatives(NoParams params);
}
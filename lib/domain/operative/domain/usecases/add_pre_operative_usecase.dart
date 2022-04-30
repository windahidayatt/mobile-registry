import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddPreOperativeUseCase extends UseCase<bool, AddPreOperativeParams> {
  final OperativeRepository _repository;
  AddPreOperativeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(AddPreOperativeParams params) {
    return _repository.addPreOperative(params);
  }
}

class AddPreOperativeParams extends Equatable {
  final String? patient;
  final String? type;
  final String? vasScore;
  final String? forwardFlexion;
  final String? abductionDegree;
  final String? externalRotationNeutral;
  final String? externalRotation90Abduction;
  final String? internalRotation;
  final String? asesScore;
  final String? dashScore;
  final String? actionPlan;
  final String? plannedDate;
  final String? progessSupportInvestigation;
  final String? progessBpjsBilling;
  final String? progressBilling;
  final String? progessAnesthesia;
  final String? progessComplete;
  final String? shoulderSpecialTestForm;
  final String? shoulerNeer;
  final String? shoulerJobe;
  final String? shoulerHawkins;
  final String? extRotationLag;
  final String? hornblower;
  final String? bellyPress;
  final String? bellyOff;
  final String? liftOff;
  final String? bearHug;
  final String? obrient;
  final String? throwing;
  final String? speed;
  final String? anteriorApprehension;
  final String? posteriorApprehension;
  final String? loadShift;
  final String? sulcusSign;
  final String? posteriorJerk;
  final String? asesScoreFile;
  final String? xRayFile;
  final String? ctScanFile;
  final String? mriFile;
  final List<String>? forwardFlexionImages;
  final List<String>? abductionDegreeImages;
  final List<String>? externalRotationNeutralImages;
  final List<String>? externalRotation90AbductionImages;
  final List<String>? internalRotationImages;

  const AddPreOperativeParams({
    this.patient,
    this.type,
    this.vasScore,
    this.forwardFlexion,
    this.abductionDegree,
    this.externalRotationNeutral,
    this.externalRotation90Abduction,
    this.internalRotation,
    this.asesScore,
    this.dashScore,
    this.actionPlan,
    this.plannedDate,
    this.progessSupportInvestigation,
    this.progessBpjsBilling,
    this.progressBilling,
    this.progessAnesthesia,
    this.progessComplete,
    this.shoulderSpecialTestForm,
    this.shoulerNeer,
    this.shoulerJobe,
    this.shoulerHawkins,
    this.extRotationLag,
    this.hornblower,
    this.bellyPress,
    this.bellyOff,
    this.liftOff,
    this.bearHug,
    this.obrient,
    this.throwing,
    this.speed,
    this.anteriorApprehension,
    this.posteriorApprehension,
    this.loadShift,
    this.sulcusSign,
    this.posteriorJerk,
    this.asesScoreFile,
    this.xRayFile,
    this.ctScanFile,
    this.mriFile,
    this.forwardFlexionImages,
    this.abductionDegreeImages,
    this.externalRotationNeutralImages,
    this.externalRotation90AbductionImages,
    this.internalRotationImages,
  });

  @override
  List<Object> get props => [];
}

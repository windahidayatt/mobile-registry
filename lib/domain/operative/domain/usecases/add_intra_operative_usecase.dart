import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/domain/repositories/operative_repository.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';

class AddIntraOperativeUseCase extends UseCase<bool, AddIntraOperativeParams> {
  final OperativeRepository _repository;
  AddIntraOperativeUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(AddIntraOperativeParams params) {
    return _repository.addIntraOperative(params);
  }
}

class AddIntraOperativeParams extends Equatable {
  final String? patient;
  final String? domainManagement;
  final String? anthroscopyOpenReduction;
  final String? humeralHeadSize;
  final String? humeralStemSize;
  final String? glenosphereSize;
  final String? actionPlan;
  final String? plannedDate;
  final String? progessSupportInvestigation;
  final String? progessBpjsBilling;
  final String? progessAnesthesia;
  final String? progessComplete;
  final String? subacromialInjection;
  final String? glenohumeralInjection;
  final String? acJointInjection;
  final String? sphSuprascapularNotch;
  final String? sphSpinoglenoidNotch;
  final String? lhbtLongAxisBg;
  final String? lhbtShortAxisBg;
  final String? lhbtRotatorInterval;
  final String? usgGuidedInjection;
  final String? anatomicalLandmarkInjection;
  final String? piOther;
  final String? lhbtTenotomy;
  final String? lhbtTenodesis;
  final String? subacromialDecompressionBursectomy;
  final String? acromioplasty;
  final String? partialRotatorCuffRepair;
  final String? rotatorCuffRepair;
  final String? superiorCapsularReconstruction;
  final String? bankartRepair;
  final String? bonyBankartRepair;
  final String? capsuleLabrumPlasty;
  final String? acJointResection;
  final String? suprascapularNerveRelease;
  final String? axillaryNerveRelease;
  final String? arthroscopyLatarjetProcedure;
  final String? saOther;
  final String? magnusonStack;
  final String? ortOther;
  final String? shoulderArthroplastyProcedure;

  const AddIntraOperativeParams(
      {this.patient,
      this.domainManagement,
      this.anthroscopyOpenReduction,
      this.humeralHeadSize,
      this.humeralStemSize,
      this.glenosphereSize,
      this.actionPlan,
      this.plannedDate,
      this.progessSupportInvestigation,
      this.progessBpjsBilling,
      this.progessAnesthesia,
      this.progessComplete,
      this.subacromialInjection,
      this.glenohumeralInjection,
      this.acJointInjection,
      this.sphSuprascapularNotch,
      this.sphSpinoglenoidNotch,
      this.lhbtLongAxisBg,
      this.lhbtShortAxisBg,
      this.lhbtRotatorInterval,
      this.usgGuidedInjection,
      this.anatomicalLandmarkInjection,
      this.piOther,
      this.lhbtTenotomy,
      this.lhbtTenodesis,
      this.subacromialDecompressionBursectomy,
      this.acromioplasty,
      this.partialRotatorCuffRepair,
      this.rotatorCuffRepair,
      this.superiorCapsularReconstruction,
      this.bankartRepair,
      this.bonyBankartRepair,
      this.capsuleLabrumPlasty,
      this.acJointResection,
      this.suprascapularNerveRelease,
      this.axillaryNerveRelease,
      this.arthroscopyLatarjetProcedure,
      this.saOther,
      this.magnusonStack,
      this.ortOther,
      this.shoulderArthroplastyProcedure});

  @override
  List<Object> get props => [];
}

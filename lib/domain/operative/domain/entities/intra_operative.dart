import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/intra_operative_response_dto.dart';

class IntraOperative extends Equatable {
  final String? id;
  final String? domainCaseName;
  final String? domainCaseId;
  final String? hospitalId;
  final String? domainManagement;
  final String? name;
  final String? age;
  final String? gender;
  final String? weight;
  final String? height;
  final String? medicalRecord;
  final String? phoneNumber;
  final String? diagnosis;
  final String? management;
  final String? createdAt;
  final String? updatedAt;
  final String? patientId;
  final String? registrationNumber;
  final String? type;
  final String? step;
  final String? userId;
  final String? registrationId;
  final String? painInterventionProcedureId;
  final String? shoulderArthroscopyProcedureId;
  final String? shoulderArthroplastyProcedureId;
  final String? openReductionAndTraumaProcedureId;
  final String? anthroscopyOpenReduction;
  final String? anchorUse;
  final String? humeralHeadSize;
  final String? humeralStemSize;
  final String? glenosphereSize;
  final String? actionPlan;
  final String? plannedDate;
  final String? progressSupportInvestigation;
  final String? progressBpjsBilling;
  final String? progressBilling;
  final String? progressAnesthesia;
  final String? progressComplete;
  final String? status;
  final String? comment;

  const IntraOperative(
      {required this.id,
        required this.domainCaseName,
        required this.domainCaseId,
        required this.hospitalId,
        required this.domainManagement,
        required this.name,
        required this.age,
        required this.gender,
        required this.weight,
        required this.height,
        required this.medicalRecord,
        required this.phoneNumber,
        required this.diagnosis,
        required this.management,
        required this.createdAt,
        required this.updatedAt,
        required this.patientId,
        required this.registrationNumber,
        required this.type,
        required this.step,
        required this.userId,
        required this.registrationId,
        required this.painInterventionProcedureId,
        required this.shoulderArthroscopyProcedureId,
        required this.shoulderArthroplastyProcedureId,
        required this.openReductionAndTraumaProcedureId,
        required this.anthroscopyOpenReduction,
        required this.anchorUse,
        required this.humeralHeadSize,
        required this.humeralStemSize,
        required this.glenosphereSize,
        required this.actionPlan,
        required this.plannedDate,
        required this.progressSupportInvestigation,
        required this.progressBpjsBilling,
        required this.progressBilling,
        required this.progressAnesthesia,
        required this.progressComplete,
        required this.status,
        required this.comment});

  factory IntraOperative.fromDTO(IntraOperativeResponseDTO dto) => IntraOperative(
    id: dto.id ?? '',
    domainCaseName: dto.domainCaseName ?? '',
    domainCaseId: dto.domainCaseId ?? '',
    hospitalId: dto.hospitalId ?? '',
    domainManagement: dto.domainManagement ?? '',
    name: dto.name ?? '',
    age: dto.age ?? '',
    gender: dto.gender ?? '',
    weight: dto.weight ?? '',
    height: dto.height ?? '',
    medicalRecord: dto.medicalRecord ?? '',
    phoneNumber: dto.phoneNumber ?? '',
    diagnosis: dto.diagnosis ?? '',
    management: dto.management ?? '',
    createdAt: dto.createdAt ?? '',
    updatedAt: dto.updatedAt ?? '',
    patientId: dto.patientId ?? '',
    registrationNumber: dto.registrationNumber ?? '',
    type: dto.type ?? '',
    step: dto.step ?? '',
    userId: dto.userId ?? '',
    registrationId: dto.registrationId ?? '',
    painInterventionProcedureId: dto.painInterventionProcedureId ?? '',
    shoulderArthroscopyProcedureId: dto.shoulderArthroscopyProcedureId ?? '',
    shoulderArthroplastyProcedureId: dto.shoulderArthroplastyProcedureId ?? '',
    openReductionAndTraumaProcedureId: dto.openReductionAndTraumaProcedureId ?? '',
    anthroscopyOpenReduction: dto.anthroscopyOpenReduction ?? '',
    anchorUse: dto.anchorUse ?? '',
    humeralHeadSize: dto.humeralHeadSize ?? '',
    humeralStemSize: dto.humeralStemSize ?? '',
    glenosphereSize: dto.glenosphereSize ?? '',
    actionPlan: dto.actionPlan ?? '',
    plannedDate: dto.plannedDate ?? '',
    progressSupportInvestigation: dto.progressSupportInvestigation ?? '',
    progressBpjsBilling: dto.progressBpjsBilling ?? '',
    progressBilling: dto.progressBilling ?? '',
    progressAnesthesia: dto.progressAnesthesia ?? '',
    progressComplete: dto.progressComplete ?? '',
    status: dto.status ?? '',
    comment: dto.comment ?? '',
  );

  @override
  List<Object> get props => [];
}

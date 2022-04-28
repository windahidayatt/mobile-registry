import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_response_dto.dart';

class PreOperative extends Equatable {
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
  final String? shoulderSpecialTestId;
  final String? vasScore;
  final String? forwardFlexion;
  final String? abductionDegree;
  final String? externalRotationNeutral;
  final String? externalRotation90Abduction;
  final String? internalRotation;
  final String? asesScore;
  final String? dashScore;
  final String? asesScoreFile;
  final String? xRayFile;
  final String? ctScanFile;
  final String? mriFile;
  final String? actionPlan;
  final String? plannedDate;
  final String? progressSupportInvestigation;
  final String? progressBpjsBilling;
  final String? progressBilling;
  final String? progressAnesthesia;
  final String? progressComplete;
  final String? status;
  final String? comment;

  const PreOperative(
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
      required this.shoulderSpecialTestId,
      required this.vasScore,
      required this.forwardFlexion,
      required this.abductionDegree,
      required this.externalRotationNeutral,
      required this.externalRotation90Abduction,
      required this.internalRotation,
      required this.asesScore,
      required this.dashScore,
      required this.asesScoreFile,
      required this.xRayFile,
      required this.ctScanFile,
      required this.mriFile,
      required this.actionPlan,
      required this.plannedDate,
      required this.progressSupportInvestigation,
      required this.progressBpjsBilling,
      required this.progressBilling,
      required this.progressAnesthesia,
      required this.progressComplete,
      required this.status,
      required this.comment});

  factory PreOperative.fromDTO(PreOperativeResponseDTO dto) => PreOperative(
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
        shoulderSpecialTestId: dto.shoulderSpecialTestId ?? '',
        vasScore: dto.vasScore ?? '',
        forwardFlexion: dto.forwardFlexion ?? '',
        abductionDegree: dto.abductionDegree ?? '',
        externalRotationNeutral: dto.externalRotationNeutral ?? '',
        externalRotation90Abduction: dto.externalRotation90Abduction ?? '',
        internalRotation: dto.internalRotation ?? '',
        asesScore: dto.asesScore ?? '',
        dashScore: dto.dashScore ?? '',
        asesScoreFile: dto.asesScoreFile ?? '',
        xRayFile: dto.xRayFile ?? '',
        ctScanFile: dto.ctScanFile ?? '',
        mriFile: dto.mriFile ?? '',
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

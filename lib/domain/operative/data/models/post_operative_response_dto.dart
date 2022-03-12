// To parse this JSON data, do
//
//     final postOperativeResponseDto = postOperativeResponseDtoFromJson(jsonString);
import 'dart:convert';

List<PostOperativeResponseDTO> postOperativeResponseDtoFromJson(String str) => List<PostOperativeResponseDTO>.from(json.decode(str).map((x) => PostOperativeResponseDTO.fromJson(x)));

String postOperativeResponseDtoToJson(List<PostOperativeResponseDTO> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostOperativeResponseDTO {
  PostOperativeResponseDTO({
    required this.id,
    required this.domainCaseName,
    required this.domainCaseId,
    required this.domainManagement,
    required this.name,
    required this.age,
    required this.gender,
    required this.weight,
    required this.height,
    required this.hospital,
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
    required this.registrationId,
    required this.shoulderSpecialTestId,
    required this.followUp,
    required this.preciseFollowUpDuration,
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
    required this.progessSupportInvestigation,
    required this.progessBpjsBilling,
    required this.progessAnesthesia,
    required this.progessComplete,
    required this.status,
    required this.comment,
  });

  final int id;
  final String domainCaseName;
  final int domainCaseId;
  final String domainManagement;
  final String name;
  final int age;
  final String gender;
  final int weight;
  final int height;
  final String hospital;
  final String medicalRecord;
  final String phoneNumber;
  final String diagnosis;
  final String management;
  final String createdAt;
  final String updatedAt;
  final int patientId;
  final String registrationNumber;
  final String type;
  final String step;
  final int registrationId;
  final int? shoulderSpecialTestId;
  final String followUp;
  final String preciseFollowUpDuration;
  final String vasScore;
  final String forwardFlexion;
  final String abductionDegree;
  final String externalRotationNeutral;
  final String externalRotation90Abduction;
  final String internalRotation;
  final String asesScore;
  final String dashScore;
  final String? asesScoreFile;
  final dynamic xRayFile;
  final dynamic ctScanFile;
  final dynamic mriFile;
  final dynamic actionPlan;
  final String? plannedDate;
  final int progessSupportInvestigation;
  final int progessBpjsBilling;
  final int progessAnesthesia;
  final int progessComplete;
  final int status;
  final String? comment;

  factory PostOperativeResponseDTO.fromJson(Map<String, dynamic> json) => PostOperativeResponseDTO(
    id: json["id"],
    domainCaseName: json["domain_case_name"],
    domainCaseId: json["domain_case_id"],
    domainManagement: json["domain_management"],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    weight: json["weight"],
    height: json["height"],
    hospital: json["hospital"],
    medicalRecord: json["medical_record"],
    phoneNumber: json["phone_number"],
    diagnosis: json["diagnosis"],
    management: json["management"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    patientId: json["patient_id"],
    registrationNumber: json["registration_number"],
    type: json["type"],
    step: json["step"],
    registrationId: json["registration_id"],
    shoulderSpecialTestId: json["shoulder_special_test_id"],
    followUp: json["follow_up"],
    preciseFollowUpDuration: json["precise_follow_up_duration"],
    vasScore: json["vas_score"],
    forwardFlexion: json["forward_flexion"],
    abductionDegree: json["abduction_degree"],
    externalRotationNeutral: json["external_rotation_neutral"],
    externalRotation90Abduction: json["external_rotation_90_abduction"],
    internalRotation: json["internal_rotation"],
    asesScore: json["ases_score"],
    dashScore: json["dash_score"],
    asesScoreFile: json["ases_score_file"],
    xRayFile: json["x_ray_file"],
    ctScanFile: json["ct_scan_file"],
    mriFile: json["mri_file"],
    actionPlan: json["action_plan"],
    plannedDate: json["planned_date"],
    progessSupportInvestigation: json["progess_support_investigation"],
    progessBpjsBilling: json["progess_bpjs_billing"],
    progessAnesthesia: json["progess_anesthesia"],
    progessComplete: json["progess_complete"],
    status: json["status"],
    comment: json["comment"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "domain_case_name": domainCaseName,
    "domain_case_id": domainCaseId,
    "domain_management": domainManagement,
    "name": name,
    "age": age,
    "gender": gender,
    "weight": weight,
    "height": height,
    "hospital": hospital,
    "medical_record": medicalRecord,
    "phone_number": phoneNumber,
    "diagnosis": diagnosis,
    "management": management,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "patient_id": patientId,
    "registration_number": registrationNumber,
    "type": type,
    "step": step,
    "registration_id": registrationId,
    "shoulder_special_test_id": shoulderSpecialTestId,
    "follow_up": followUp,
    "precise_follow_up_duration": preciseFollowUpDuration,
    "vas_score": vasScore,
    "forward_flexion": forwardFlexion,
    "abduction_degree": abductionDegree,
    "external_rotation_neutral": externalRotationNeutral,
    "external_rotation_90_abduction": externalRotation90Abduction,
    "internal_rotation": internalRotation,
    "ases_score": asesScore,
    "dash_score": dashScore,
    "ases_score_file": asesScoreFile,
    "x_ray_file": xRayFile,
    "ct_scan_file": ctScanFile,
    "mri_file": mriFile,
    "action_plan": actionPlan,
    "planned_date": plannedDate,
    "progess_support_investigation": progessSupportInvestigation,
    "progess_bpjs_billing": progessBpjsBilling,
    "progess_anesthesia": progessAnesthesia,
    "progess_complete": progessComplete,
    "status": status,
    "comment": comment,
  };
}

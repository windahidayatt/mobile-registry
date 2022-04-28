// To parse this JSON data, do
//
//     final postOperativeResponseDto = postOperativeResponseDtoFromJson(jsonString);
import 'dart:convert';

List<PostOperativeResponseDTO> postOperativeResponseDtoFromJson(String str) => List<PostOperativeResponseDTO>.from(json.decode(str).map((x) => PostOperativeResponseDTO.fromJson(x)));

String postOperativeResponseDtoToJson(List<PostOperativeResponseDTO> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostOperativeResponseDTO {
  String? id;
  String? domainCaseName;
  String? domainCaseId;
  String? hospitalId;
  String? domainManagement;
  String? name;
  String? age;
  String? gender;
  String? weight;
  String? height;
  String? medicalRecord;
  String? phoneNumber;
  String? diagnosis;
  String? management;
  String? createdAt;
  String? updatedAt;
  String? patientId;
  String? registrationNumber;
  String? type;
  String? step;
  String? userId;
  String? registrationId;
  String? shoulderSpecialTestId;
  String? followUp;
  String? preciseFollowUpDuration;
  String? vasScore;
  String? forwardFlexion;
  String? abductionDegree;
  String? externalRotationNeutral;
  String? externalRotation90Abduction;
  String? internalRotation;
  String? asesScore;
  String? dashScore;
  String? asesScoreFile;
  String? xRayFile;
  String? ctScanFile;
  String? mriFile;
  String? actionPlan;
  String? plannedDate;
  String? progressSupportInvestigation;
  String? progressBpjsBilling;
  String? progressBilling;
  String? progressAnesthesia;
  String? progressComplete;
  String? status;
  String? comment;

  PostOperativeResponseDTO(
      {this.id,
        this.domainCaseName,
        this.domainCaseId,
        this.hospitalId,
        this.domainManagement,
        this.name,
        this.age,
        this.gender,
        this.weight,
        this.height,
        this.medicalRecord,
        this.phoneNumber,
        this.diagnosis,
        this.management,
        this.createdAt,
        this.updatedAt,
        this.patientId,
        this.registrationNumber,
        this.type,
        this.step,
        this.userId,
        this.registrationId,
        this.shoulderSpecialTestId,
        this.followUp,
        this.preciseFollowUpDuration,
        this.vasScore,
        this.forwardFlexion,
        this.abductionDegree,
        this.externalRotationNeutral,
        this.externalRotation90Abduction,
        this.internalRotation,
        this.asesScore,
        this.dashScore,
        this.asesScoreFile,
        this.xRayFile,
        this.ctScanFile,
        this.mriFile,
        this.actionPlan,
        this.plannedDate,
        this.progressSupportInvestigation,
        this.progressBpjsBilling,
        this.progressBilling,
        this.progressAnesthesia,
        this.progressComplete,
        this.status,
        this.comment});

  PostOperativeResponseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domainCaseName = json['domain_case_name'];
    domainCaseId = json['domain_case_id'];
    hospitalId = json['hospital_id'];
    domainManagement = json['domain_management'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    medicalRecord = json['medical_record'];
    phoneNumber = json['phone_number'];
    diagnosis = json['diagnosis'];
    management = json['management'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    patientId = json['patient_id'];
    registrationNumber = json['registration_number'];
    type = json['type'];
    step = json['step'];
    userId = json['user_id'];
    registrationId = json['registration_id'];
    shoulderSpecialTestId = json['shoulder_special_test_id'];
    followUp = json['follow_up'];
    preciseFollowUpDuration = json['precise_follow_up_duration'];
    vasScore = json['vas_score'];
    forwardFlexion = json['forward_flexion'];
    abductionDegree = json['abduction_degree'];
    externalRotationNeutral = json['external_rotation_neutral'];
    externalRotation90Abduction = json['external_rotation_90_abduction'];
    internalRotation = json['internal_rotation'];
    asesScore = json['ases_score'];
    dashScore = json['dash_score'];
    asesScoreFile = json['ases_score_file'];
    xRayFile = json['x_ray_file'];
    ctScanFile = json['ct_scan_file'];
    mriFile = json['mri_file'];
    actionPlan = json['action_plan'];
    plannedDate = json['planned_date'];
    progressSupportInvestigation = json['progress_support_investigation'];
    progressBpjsBilling = json['progress_bpjs_billing'];
    progressBilling = json['progress_billing'];
    progressAnesthesia = json['progress_anesthesia'];
    progressComplete = json['progress_complete'];
    status = json['status'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['domain_case_name'] = domainCaseName;
    data['domain_case_id'] = domainCaseId;
    data['hospital_id'] = hospitalId;
    data['domain_management'] = domainManagement;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['medical_record'] = medicalRecord;
    data['phone_number'] = phoneNumber;
    data['diagnosis'] = diagnosis;
    data['management'] = management;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['patient_id'] = patientId;
    data['registration_number'] = registrationNumber;
    data['type'] = type;
    data['step'] = step;
    data['user_id'] = userId;
    data['registration_id'] = registrationId;
    data['shoulder_special_test_id'] = shoulderSpecialTestId;
    data['follow_up'] = followUp;
    data['precise_follow_up_duration'] = preciseFollowUpDuration;
    data['vas_score'] = vasScore;
    data['forward_flexion'] = forwardFlexion;
    data['abduction_degree'] = abductionDegree;
    data['external_rotation_neutral'] = externalRotationNeutral;
    data['external_rotation_90_abduction'] = externalRotation90Abduction;
    data['internal_rotation'] = internalRotation;
    data['ases_score'] = asesScore;
    data['dash_score'] = dashScore;
    data['ases_score_file'] = asesScoreFile;
    data['x_ray_file'] = xRayFile;
    data['ct_scan_file'] = ctScanFile;
    data['mri_file'] = mriFile;
    data['action_plan'] = actionPlan;
    data['planned_date'] = plannedDate;
    data['progress_support_investigation'] = progressSupportInvestigation;
    data['progress_bpjs_billing'] = progressBpjsBilling;
    data['progress_billing'] = progressBilling;
    data['progress_anesthesia'] = progressAnesthesia;
    data['progress_complete'] = progressComplete;
    data['status'] = status;
    data['comment'] = comment;
    return data;
  }
}

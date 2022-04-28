// To parse this JSON data, do
//
//     final intraOperativeResponseDto = intraOperativeResponseDtoFromJson(jsonString);
import 'dart:convert';

List<IntraOperativeResponseDTO> intraOperativeResponseDtoFromJson(String str) =>
    List<IntraOperativeResponseDTO>.from(
        json.decode(str).map((x) => IntraOperativeResponseDTO.fromJson(x)));

String intraOperativeResponseDtoToJson(List<IntraOperativeResponseDTO> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IntraOperativeResponseDTO {
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
  String? painInterventionProcedureId;
  String? shoulderArthroscopyProcedureId;
  String? shoulderArthroplastyProcedureId;
  String? openReductionAndTraumaProcedureId;
  String? anthroscopyOpenReduction;
  String? anchorUse;
  String? humeralHeadSize;
  String? humeralStemSize;
  String? glenosphereSize;
  String? actionPlan;
  String? plannedDate;
  String? progressSupportInvestigation;
  String? progressBpjsBilling;
  String? progressBilling;
  String? progressAnesthesia;
  String? progressComplete;
  String? status;
  String? comment;

  IntraOperativeResponseDTO(
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
        this.painInterventionProcedureId,
        this.shoulderArthroscopyProcedureId,
        this.shoulderArthroplastyProcedureId,
        this.openReductionAndTraumaProcedureId,
        this.anthroscopyOpenReduction,
        this.anchorUse,
        this.humeralHeadSize,
        this.humeralStemSize,
        this.glenosphereSize,
        this.actionPlan,
        this.plannedDate,
        this.progressSupportInvestigation,
        this.progressBpjsBilling,
        this.progressBilling,
        this.progressAnesthesia,
        this.progressComplete,
        this.status,
        this.comment});

  IntraOperativeResponseDTO.fromJson(Map<String, dynamic> json) {
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
    painInterventionProcedureId = json['pain_intervention_procedure_id'];
    shoulderArthroscopyProcedureId = json['shoulder_arthroscopy_procedure_id'];
    shoulderArthroplastyProcedureId =
    json['shoulder_arthroplasty_procedure_id'];
    openReductionAndTraumaProcedureId =
    json['open_reduction_and_trauma_procedure_id'];
    anthroscopyOpenReduction = json['anthroscopy_open_reduction'];
    anchorUse = json['anchor_use'];
    humeralHeadSize = json['humeral_head_size'];
    humeralStemSize = json['humeral_stem_size'];
    glenosphereSize = json['glenosphere_size'];
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
    data['pain_intervention_procedure_id'] = painInterventionProcedureId;
    data['shoulder_arthroscopy_procedure_id'] =
        shoulderArthroscopyProcedureId;
    data['shoulder_arthroplasty_procedure_id'] =
        shoulderArthroplastyProcedureId;
    data['open_reduction_and_trauma_procedure_id'] =
        openReductionAndTraumaProcedureId;
    data['anthroscopy_open_reduction'] = anthroscopyOpenReduction;
    data['anchor_use'] = anchorUse;
    data['humeral_head_size'] = humeralHeadSize;
    data['humeral_stem_size'] = humeralStemSize;
    data['glenosphere_size'] = glenosphereSize;
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

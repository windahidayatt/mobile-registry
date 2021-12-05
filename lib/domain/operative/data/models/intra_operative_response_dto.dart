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
  IntraOperativeResponseDTO({
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
  final int? painInterventionProcedureId;
  final int? shoulderArthroscopyProcedureId;
  final int? shoulderArthroplastyProcedureId;
  final int? openReductionAndTraumaProcedureId;
  final String anthroscopyOpenReduction;
  final String? anchorUse;
  final String humeralHeadSize;
  final String humeralStemSize;
  final String glenosphereSize;
  final String actionPlan;
  final String? plannedDate;
  final int progessSupportInvestigation;
  final int progessBpjsBilling;
  final int progessAnesthesia;
  final int progessComplete;
  final int status;
  final dynamic comment;

  factory IntraOperativeResponseDTO.fromJson(Map<String, dynamic> json) =>
      IntraOperativeResponseDTO(
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
        painInterventionProcedureId: json["pain_intervention_procedure_id"],
        shoulderArthroscopyProcedureId:
            json["shoulder_arthroscopy_procedure_id"],
        shoulderArthroplastyProcedureId:
            json["shoulder_arthroplasty_procedure_id"],
        openReductionAndTraumaProcedureId:
            json["open_reduction_and_trauma_procedure_id"],
        anthroscopyOpenReduction: json["anthroscopy_open_reduction"],
        anchorUse: json["anchor_use"],
        humeralHeadSize: json["humeral_head_size"],
        humeralStemSize: json["humeral_stem_size"],
        glenosphereSize: json["glenosphere_size"],
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
        "pain_intervention_procedure_id": painInterventionProcedureId,
        "shoulder_arthroscopy_procedure_id": shoulderArthroscopyProcedureId,
        "shoulder_arthroplasty_procedure_id": shoulderArthroplastyProcedureId,
        "open_reduction_and_trauma_procedure_id":
            openReductionAndTraumaProcedureId,
        "anthroscopy_open_reduction": anthroscopyOpenReduction,
        "anchor_use": anchorUse,
        "humeral_head_size": humeralHeadSize,
        "humeral_stem_size": humeralStemSize,
        "glenosphere_size": glenosphereSize,
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

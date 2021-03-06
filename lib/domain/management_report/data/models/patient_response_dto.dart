// To parse this JSON data, do
//
//     final patientResponseDto = patientResponseDtoFromJson(jsonString);
import 'dart:convert';

List<PatientResponseDTO> patientResponseListDtoFromJson(String str) => List<PatientResponseDTO>.from(json.decode(str).map((x) => PatientResponseDTO.fromJson(x)));

PatientResponseDTO patientResponseDtoFromJson(String str) => PatientResponseDTO.fromJson(json.decode(str));

String patientResponseDtoToJson(PatientResponseDTO data) => json.encode(data.toJson());

class PatientResponseDTO {
  int? id;
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

  PatientResponseDTO(
      {this.id,
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
        this.updatedAt});

  PatientResponseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    return data;
  }
}
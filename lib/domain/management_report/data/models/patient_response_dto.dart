// To parse this JSON data, do
//
//     final patientResponseDto = patientResponseDtoFromJson(jsonString);
import 'dart:convert';

List<PatientResponseDTO> patientResponseListDtoFromJson(String str) => List<PatientResponseDTO>.from(json.decode(str).map((x) => PatientResponseDTO.fromJson(x)));

PatientResponseDTO patientResponseDtoFromJson(String str) => PatientResponseDTO.fromJson(json.decode(str));

String patientResponseDtoToJson(PatientResponseDTO data) => json.encode(data.toJson());

class PatientResponseDTO {
  PatientResponseDTO({
    required this.id,
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
  });

  final int id;
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

  factory PatientResponseDTO.fromJson(Map<String, dynamic> json) => PatientResponseDTO(
    id: json["id"],
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
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
  };
}

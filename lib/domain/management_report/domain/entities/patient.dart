import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/management_report/data/models/patient_response_dto.dart';

class Patient extends Equatable {
  final int? id;
  final int? hospitalId;
  final int? domainCaseId;
  final String? domainManagement;
  final String? name;
  final int? age;
  final String? gender;
  final int? weight;
  final int? height;
  final String? medicalRecord;
  final String? phoneNumber;
  final String? diagnosis;
  final String? management;
  final String? createdAt;
  final String? updatedAt;

  const Patient({
    required this.id,
    required this.hospitalId,
    required this.domainCaseId,
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
  });

  factory Patient.fromDTO(PatientResponseDTO dto) => Patient(
        id: dto.id,
        domainCaseId: int.parse(dto.domainCaseId ?? '0'),
        domainManagement: dto.domainManagement,
        name: dto.name,
        age: int.parse(dto.age ?? '0'),
        gender: dto.gender,
        weight: int.parse(dto.weight ?? '0'),
        height: int.parse(dto.height ?? '0'),
        medicalRecord: dto.medicalRecord,
        phoneNumber: dto.phoneNumber,
        diagnosis: dto.diagnosis,
        management: dto.management,
        createdAt: dto.createdAt,
        hospitalId: int.parse(dto.hospitalId ?? ''),
        updatedAt: dto.updatedAt,
      );

  @override
  List<Object> get props => [];
}

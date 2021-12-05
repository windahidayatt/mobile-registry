import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/management_report/data/models/patient_response_dto.dart';

class Patient extends Equatable {
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

  const Patient(
      {required this.id,
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
      required this.createdAt});

  factory Patient.fromDTO(PatientResponseDTO dto) => Patient(
        id: dto.id,
        domainCaseId: dto.domainCaseId,
        domainManagement: dto.domainManagement,
        name: dto.name,
        age: dto.age,
        gender: dto.gender,
        weight: dto.weight,
        height: dto.height,
        hospital: dto.hospital,
        medicalRecord: dto.medicalRecord,
        phoneNumber: dto.phoneNumber,
        diagnosis: dto.diagnosis,
        management: dto.management,
        createdAt: dto.createdAt,
      );

  @override
  List<Object> get props => [];
}

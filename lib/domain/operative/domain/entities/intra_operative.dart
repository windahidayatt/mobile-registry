import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/intra_operative_response_dto.dart';

class IntraOperative extends Equatable {
  final int id;
  final String name;
  final String domainCaseName;
  final String medicalRecord;
  final String management;
  final String gender;

  const IntraOperative({
    required this.id,
    required this.name,
    required this.domainCaseName,
    required this.medicalRecord,
    required this.management,
    required this.gender,
  });

  factory IntraOperative.fromDTO(IntraOperativeResponseDTO dto) =>
      IntraOperative(
        id: int.parse(dto.id ?? '0'),
        name: dto.name ?? '',
        domainCaseName: dto.domainCaseName ?? '',
        medicalRecord: dto.medicalRecord ?? '',
        management: dto.management ?? '',
        gender: dto.gender ?? '',
      );

  @override
  List<Object> get props => [];
}

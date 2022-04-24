import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_response_dto.dart';

class PreOperative extends Equatable {
  final int id;
  final String name;
  final String domainCaseName;
  final String medicalRecord;
  final String management;
  final String gender;

  const PreOperative({
    required this.id,
    required this.name,
    required this.domainCaseName,
    required this.medicalRecord,
    required this.management,
    required this.gender,
  });

  factory PreOperative.fromDTO(PreOperativeResponseDTO dto) => PreOperative(
        id: int.parse(dto.id ?? ''),
        name: dto.name ?? '',
        domainCaseName: dto.domainCaseName ?? '',
        medicalRecord: dto.medicalRecord ?? '',
        management: dto.management ?? '',
        gender: dto.gender ?? '',
      );

  @override
  List<Object> get props => [];
}

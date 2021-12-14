import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/intra_operative_response_dto.dart';

class IntraOperative extends Equatable {
  final int id;
  final String name;
  final String domainCaseName;
  final String hospital;
  final String management;
  final String gender;

  const IntraOperative({
    required this.id,
    required this.name,
    required this.domainCaseName,
    required this.hospital,
    required this.management,
    required this.gender,
  });

  factory IntraOperative.fromDTO(IntraOperativeResponseDTO dto) => IntraOperative(
    id: dto.id,
    name: dto.name,
    domainCaseName: dto.domainCaseName,
    hospital: dto.hospital,
    management: dto.management,
    gender: dto.gender,
  );

  @override
  List<Object> get props => [];
}

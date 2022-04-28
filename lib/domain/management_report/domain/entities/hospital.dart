import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/management_report/data/models/hospitals_response_dto.dart';

class Hospital extends Equatable {
  final int? id;
  final String? name;
  final String? address;
  final String? logoPict;
  final String? createdAt;
  final String? updatedAt;

  const Hospital({
    required this.id,
    required this.name,
    required this.address,
    required this.logoPict,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Hospital.fromDTO(HospitalsResponseDTO dto) => Hospital(
      id: dto.id ?? 0,
      name: dto.name ?? '',
      address: dto.address ?? '',
      logoPict: dto.logoPict ?? '',
      createdAt: dto.createdAt ?? '',
      updatedAt: dto.updatedAt ?? '');

  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/intra_operative_response_dto.dart';

class IntraOperative extends Equatable {
  final int id;
  final String name;

  const IntraOperative({
    required this.id,
    required this.name,
  });

  factory IntraOperative.fromDTO(IntraOperativeResponseDTO dto) => IntraOperative(
    id: dto.id,
    name: dto.name,
  );

  @override
  List<Object> get props => [];
}

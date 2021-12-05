import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_operative_response_dto.dart';

class PreOperative extends Equatable {
  final int id;
  final String name;

  const PreOperative({
    required this.id,
    required this.name,
  });

  factory PreOperative.fromDTO(PreOperativeResponseDTO dto) => PreOperative(
        id: dto.id,
        name: dto.name,
      );

  @override
  List<Object> get props => [];
}

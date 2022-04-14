import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/management_report/data/models/domain_case_response_dto.dart';

class DomainCase extends Equatable {
  final int id;
  final String name;

  const DomainCase({
    required this.id,
    required this.name,
  });

  factory DomainCase.fromDTO(DomainCaseResponseDTO dto) => DomainCase(
        id: dto.id ?? 0,
        name: dto.domainCaseName ?? '',
      );

  @override
  List<Object> get props => [];
}

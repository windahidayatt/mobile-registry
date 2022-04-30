import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/intra_patients_response_dto.dart';

class IntraPatients extends Equatable {
  final String patientInfo;

  const IntraPatients({
    required this.patientInfo,
  });

  factory IntraPatients.fromDTO(IntraPatientsResponseDTO dto) => IntraPatients(
        patientInfo: dto.patientInfo ?? '',
      );

  @override
  List<Object> get props => [];
}

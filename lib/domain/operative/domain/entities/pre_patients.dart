import 'package:equatable/equatable.dart';
import 'package:mobile_registry/domain/operative/data/models/pre_patients_response_dto.dart';

class PrePatients extends Equatable {
  final String patientInfo;

  const PrePatients({
    required this.patientInfo,
  });

  factory PrePatients.fromDTO(PrePatientsResponseDTO dto) => PrePatients(
    patientInfo: dto.patientInfo ?? '',
  );

  @override
  List<Object> get props => [];
}

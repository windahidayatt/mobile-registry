import 'dart:convert';

List<PrePatientsResponseDTO> prePatientsResponseDtoFromJson(String str) =>
    List<PrePatientsResponseDTO>.from(
      json.decode(str).map(
            (x) => PrePatientsResponseDTO.fromJson(x),
          ),
    );

List<PrePatientsResponseDTO> prePatientsResponseDtoFromJsonArray(String str) {
  List<dynamic> patientInfo = json.decode(str) as List<dynamic>;
  return List<PrePatientsResponseDTO>.from(
    patientInfo.map(
      (e) => PrePatientsResponseDTO(patientInfo: e),
    ),
  );
}

class PrePatientsResponseDTO {
  String? patientInfo;

  PrePatientsResponseDTO({this.patientInfo});

  PrePatientsResponseDTO.fromJson(Map<String, dynamic> json) {
    patientInfo = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = patientInfo;
    return data;
  }
}

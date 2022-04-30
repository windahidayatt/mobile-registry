import 'dart:convert';

List<IntraPatientsResponseDTO> intraPatientsResponseDtoFromJson(String str) =>
    List<IntraPatientsResponseDTO>.from(
      json.decode(str).map(
            (x) => IntraPatientsResponseDTO.fromJson(x),
          ),
    );

List<IntraPatientsResponseDTO> intraPatientsResponseDtoFromJsonArray(String str) {
  List<dynamic> patientInfo = json.decode(str) as List<dynamic>;
  return List<IntraPatientsResponseDTO>.from(
    patientInfo.map(
      (e) => IntraPatientsResponseDTO(patientInfo: e),
    ),
  );
}

class IntraPatientsResponseDTO {
  String? patientInfo;

  IntraPatientsResponseDTO({this.patientInfo});

  IntraPatientsResponseDTO.fromJson(Map<String, dynamic> json) {
    patientInfo = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = patientInfo;
    return data;
  }
}

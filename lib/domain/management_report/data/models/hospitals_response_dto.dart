import 'dart:convert';

List<HospitalsResponseDTO> hospitalResponseListDtoFromJson(String str) =>
    List<HospitalsResponseDTO>.from(
        json.decode(str).map((x) => HospitalsResponseDTO.fromJson(x)));

class HospitalsResponseDTO {
  int? id;
  String? name;
  String? address;
  String? logoPict;
  String? createdAt;
  String? updatedAt;

  HospitalsResponseDTO(
      {this.id,
      this.name,
      this.address,
      this.logoPict,
      this.createdAt,
      this.updatedAt});

  HospitalsResponseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    logoPict = json['logo_pict'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['logo_pict'] = logoPict;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

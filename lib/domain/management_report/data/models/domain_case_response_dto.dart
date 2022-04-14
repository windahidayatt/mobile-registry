import 'dart:convert';

List<DomainCaseResponseDTO> domainCaseResponseListDtoFromJson(String str) =>
    List<DomainCaseResponseDTO>.from(
      json.decode(str).map(
            (x) => DomainCaseResponseDTO.fromJson(x),
          ),
    );

class DomainCaseResponseDTO {
  int? id;
  String? domainCaseName;

  DomainCaseResponseDTO({
    this.id,
    this.domainCaseName,
  });

  DomainCaseResponseDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domainCaseName = json['domain_case_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['domain_case_name'] = domainCaseName;
    return data;
  }
}

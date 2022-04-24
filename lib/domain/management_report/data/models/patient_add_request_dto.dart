class PatientAddRequestDTO {
  String? domainCase;
  String? domainManagement;
  String? name;
  String? age;
  String? gender;
  String? weight;
  String? height;
  String? hospital;
  String? medicalRecord;
  String? phoneNumber;
  String? diagnosis;
  String? management;

  PatientAddRequestDTO(
      {this.domainCase,
        this.domainManagement,
        this.name,
        this.age,
        this.gender,
        this.weight,
        this.height,
        this.hospital,
        this.medicalRecord,
        this.phoneNumber,
        this.diagnosis,
        this.management});

  PatientAddRequestDTO.fromJson(Map<String, dynamic> json) {
    domainCase = json['domain_case'];
    domainManagement = json['domain_management'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    hospital = json['hospital'];
    medicalRecord = json['medical_record'];
    phoneNumber = json['phone_number'];
    diagnosis = json['diagnosis'];
    management = json['management'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['domain_case'] = domainCase;
    data['domain_management'] = domainManagement;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['hospital'] = hospital;
    data['medical_record'] = medicalRecord;
    data['phone_number'] = phoneNumber;
    data['diagnosis'] = diagnosis;
    data['management'] = management;
    return data;
  }
}
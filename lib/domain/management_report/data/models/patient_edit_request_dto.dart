class PatientEditRequestDTO {
  String? domainCaseId;
  String? domainManagement;
  String? name;
  String? age;
  String? gender;
  String? weight;
  String? height;
  String? hospitalId;
  String? medicalRecord;
  String? phoneNumber;
  String? diagnosis;
  String? management;

  PatientEditRequestDTO(
      {this.domainCaseId,
        this.domainManagement,
        this.name,
        this.age,
        this.gender,
        this.weight,
        this.height,
        this.hospitalId,
        this.medicalRecord,
        this.phoneNumber,
        this.diagnosis,
        this.management});

  PatientEditRequestDTO.fromJson(Map<String, dynamic> json) {
    domainCaseId = json['domain_case_id'];
    domainManagement = json['domain_management'];
    name = json['name'];
    age = json['age'];
    gender = json['gender'];
    weight = json['weight'];
    height = json['height'];
    hospitalId = json['hospital_id'];
    medicalRecord = json['medical_record'];
    phoneNumber = json['phone_number'];
    diagnosis = json['diagnosis'];
    management = json['management'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['domain_case_id'] = domainCaseId;
    data['domain_management'] = domainManagement;
    data['name'] = name;
    data['age'] = age;
    data['gender'] = gender;
    data['weight'] = weight;
    data['height'] = height;
    data['hospital_id'] = hospitalId;
    data['medical_record'] = medicalRecord;
    data['phone_number'] = phoneNumber;
    data['diagnosis'] = diagnosis;
    data['management'] = management;
    return data;
  }
}
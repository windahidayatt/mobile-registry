class PreOperativeAddRequestDTO {
  String? patient;
  String? type;
  String? vasScore;
  String? forwardFlexion;
  String? abductionDegree;
  String? externalRotationNeutral;
  String? externalRotation90Abduction;
  String? internalRotation;
  String? asesScore;
  String? dashScore;
  String? actionPlan;
  String? plannedDate;
  String? progessSupportInvestigation;
  String? progessBpjsBilling;
  String? progressBilling;
  String? progessAnesthesia;
  String? progessComplete;
  String? shoulderSpecialTestForm;
  String? shoulerNeer;
  String? shoulerJobe;
  String? shoulerHawkins;
  String? extRotationLag;
  String? hornblower;
  String? bellyPress;
  String? bellyOff;
  String? liftOff;
  String? bearHug;
  String? obrient;
  String? throwing;
  String? speed;
  String? anteriorApprehension;
  String? posteriorApprehension;
  String? loadShift;
  String? sulcusSign;
  String? posteriorJerk;
  String? asesScoreFile;
  String? xRayFile;
  String? ctScanFile;
  String? mriFile;

  PreOperativeAddRequestDTO(
      {this.patient,
        this.type,
        this.vasScore,
        this.forwardFlexion,
        this.abductionDegree,
        this.externalRotationNeutral,
        this.externalRotation90Abduction,
        this.internalRotation,
        this.asesScore,
        this.dashScore,
        this.actionPlan,
        this.plannedDate,
        this.progessSupportInvestigation,
        this.progessBpjsBilling,
        this.progressBilling,
        this.progessAnesthesia,
        this.progessComplete,
        this.shoulderSpecialTestForm,
        this.shoulerNeer,
        this.shoulerJobe,
        this.shoulerHawkins,
        this.extRotationLag,
        this.hornblower,
        this.bellyPress,
        this.bellyOff,
        this.liftOff,
        this.bearHug,
        this.obrient,
        this.throwing,
        this.speed,
        this.anteriorApprehension,
        this.posteriorApprehension,
        this.loadShift,
        this.sulcusSign,
        this.posteriorJerk,
        this.asesScoreFile,
        this.xRayFile,
        this.ctScanFile,
        this.mriFile});

  PreOperativeAddRequestDTO.fromJson(Map<String, dynamic> json) {
    patient = json['patient'];
    type = json['type'];
    vasScore = json['vas_score'];
    forwardFlexion = json['forward_flexion'];
    abductionDegree = json['abduction_degree'];
    externalRotationNeutral = json['external_rotation_neutral'];
    externalRotation90Abduction = json['external_rotation_90_abduction'];
    internalRotation = json['internal_rotation'];
    asesScore = json['ases_score'];
    dashScore = json['dash_score'];
    actionPlan = json['action_plan'];
    plannedDate = json['planned_date'];
    progessSupportInvestigation = json['progess_support_investigation'];
    progessBpjsBilling = json['progess_bpjs_billing'];
    progressBilling = json['progress_billing'];
    progessAnesthesia = json['progess_anesthesia'];
    progessComplete = json['progess_complete'];
    shoulderSpecialTestForm = json['shoulder_special_test_form'];
    shoulerNeer = json['shouler_neer'];
    shoulerJobe = json['shouler_jobe'];
    shoulerHawkins = json['shouler_hawkins'];
    extRotationLag = json['ext_rotation_lag'];
    hornblower = json['hornblower'];
    bellyPress = json['belly_press'];
    bellyOff = json['belly_off'];
    liftOff = json['lift_off'];
    bearHug = json['bear_hug'];
    obrient = json['obrient'];
    throwing = json['throwing'];
    speed = json['speed'];
    anteriorApprehension = json['anterior_apprehension'];
    posteriorApprehension = json['posterior_apprehension'];
    loadShift = json['load_shift'];
    sulcusSign = json['sulcus_sign'];
    posteriorJerk = json['posterior_jerk'];
    asesScoreFile = json['ases_score_file'];
    xRayFile = json['x_ray_file'];
    ctScanFile = json['ct_scan_file'];
    mriFile = json['mri_file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = '1';
    data['patient'] = patient;
    data['type'] = type;
    data['vas_score'] = vasScore;
    data['forward_flexion'] = forwardFlexion;
    data['abduction_degree'] = abductionDegree;
    data['external_rotation_neutral'] = externalRotationNeutral;
    data['external_rotation_90_abduction'] = externalRotation90Abduction;
    data['internal_rotation'] = internalRotation;
    data['ases_score'] = asesScore;
    data['dash_score'] = dashScore;
    data['action_plan'] = actionPlan;
    data['planned_date'] = plannedDate;
    data['progess_support_investigation'] = progessSupportInvestigation;
    data['progess_bpjs_billing'] = progessBpjsBilling;
    data['progress_billing'] = progressBilling;
    data['progess_anesthesia'] = progessAnesthesia;
    data['progess_complete'] = progessComplete;
    data['shoulder_special_test_form'] = shoulderSpecialTestForm;
    data['shouler_neer'] = shoulerNeer;
    data['shouler_jobe'] = shoulerJobe;
    data['shouler_hawkins'] = shoulerHawkins;
    data['ext_rotation_lag'] = extRotationLag;
    data['hornblower'] = hornblower;
    data['belly_press'] = bellyPress;
    data['belly_off'] = bellyOff;
    data['lift_off'] = liftOff;
    data['bear_hug'] = bearHug;
    data['obrient'] = obrient;
    data['throwing'] = throwing;
    data['speed'] = speed;
    data['anterior_apprehension'] = anteriorApprehension;
    data['posterior_apprehension'] = posteriorApprehension;
    data['load_shift'] = loadShift;
    data['sulcus_sign'] = sulcusSign;
    data['posterior_jerk'] = posteriorJerk;
    if(asesScoreFile != null){
      data['ases_score_file'] = asesScoreFile;
    }
    if(xRayFile != null){
      data['x_ray_file'] = xRayFile;
    }
    if(ctScanFile != null){
      data['ct_scan_file'] = ctScanFile;
    }
    if(mriFile != null){
      data['mri_file'] = mriFile;
    }
    return data;
  }
}
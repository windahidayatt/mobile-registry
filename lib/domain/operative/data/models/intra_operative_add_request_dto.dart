class IntraOperativeAddRequestDTO {
  String? patient;
  String? domainManagement;
  String? anthroscopyOpenReduction;
  String? humeralHeadSize;
  String? humeralStemSize;
  String? glenosphereSize;
  String? actionPlan;
  String? plannedDate;
  String? progessSupportInvestigation;
  String? progessBpjsBilling;
  String? progessAnesthesia;
  String? progessComplete;
  String? subacromialInjection;
  String? glenohumeralInjection;
  String? acJointInjection;
  String? sphSuprascapularNotch;
  String? sphSpinoglenoidNotch;
  String? lhbtLongAxisBg;
  String? lhbtShortAxisBg;
  String? lhbtRotatorInterval;
  String? usgGuidedInjection;
  String? anatomicalLandmarkInjection;
  String? piOther;
  String? lhbtTenotomy;
  String? lhbtTenodesis;
  String? subacromialDecompressionBursectomy;
  String? acromioplasty;
  String? partialRotatorCuffRepair;
  String? rotatorCuffRepair;
  String? superiorCapsularReconstruction;
  String? bankartRepair;
  String? bonyBankartRepair;
  String? capsuleLabrumPlasty;
  String? acJointResection;
  String? suprascapularNerveRelease;
  String? axillaryNerveRelease;
  String? arthroscopyLatarjetProcedure;
  String? saOther;
  String? magnusonStack;
  String? ortOther;
  String? shoulderArthroplastyProcedure;

  IntraOperativeAddRequestDTO(
      {this.patient,
        this.domainManagement,
        this.anthroscopyOpenReduction,
        this.humeralHeadSize,
        this.humeralStemSize,
        this.glenosphereSize,
        this.actionPlan,
        this.plannedDate,
        this.progessSupportInvestigation,
        this.progessBpjsBilling,
        this.progessAnesthesia,
        this.progessComplete,
        this.subacromialInjection,
        this.glenohumeralInjection,
        this.acJointInjection,
        this.sphSuprascapularNotch,
        this.sphSpinoglenoidNotch,
        this.lhbtLongAxisBg,
        this.lhbtShortAxisBg,
        this.lhbtRotatorInterval,
        this.usgGuidedInjection,
        this.anatomicalLandmarkInjection,
        this.piOther,
        this.lhbtTenotomy,
        this.lhbtTenodesis,
        this.subacromialDecompressionBursectomy,
        this.acromioplasty,
        this.partialRotatorCuffRepair,
        this.rotatorCuffRepair,
        this.superiorCapsularReconstruction,
        this.bankartRepair,
        this.bonyBankartRepair,
        this.capsuleLabrumPlasty,
        this.acJointResection,
        this.suprascapularNerveRelease,
        this.axillaryNerveRelease,
        this.arthroscopyLatarjetProcedure,
        this.saOther,
        this.magnusonStack,
        this.ortOther,
        this.shoulderArthroplastyProcedure});

  IntraOperativeAddRequestDTO.fromJson(Map<String, dynamic> json) {
    patient = json['patient'];
    domainManagement = json['domain_management'];
    anthroscopyOpenReduction = json['anthroscopy_open_reduction'];
    humeralHeadSize = json['humeral_head_size'];
    humeralStemSize = json['humeral_stem_size'];
    glenosphereSize = json['glenosphere_size'];
    actionPlan = json['action_plan'];
    plannedDate = json['planned_date'];
    progessSupportInvestigation = json['progess_support_investigation'];
    progessBpjsBilling = json['progess_bpjs_billing'];
    progessAnesthesia = json['progess_anesthesia'];
    progessComplete = json['progess_complete'];
    subacromialInjection = json['subacromial_injection'];
    glenohumeralInjection = json['glenohumeral_injection'];
    acJointInjection = json['ac_joint_injection'];
    sphSuprascapularNotch = json['sph_suprascapular_notch'];
    sphSpinoglenoidNotch = json['sph_spinoglenoid_notch'];
    lhbtLongAxisBg = json['lhbt_long_axis_bg'];
    lhbtShortAxisBg = json['lhbt_short_axis_bg'];
    lhbtRotatorInterval = json['lhbt_rotator_interval'];
    usgGuidedInjection = json['usg_guided_injection'];
    anatomicalLandmarkInjection = json['anatomical_landmark_injection'];
    piOther = json['pi_other'];
    lhbtTenotomy = json['lhbt_tenotomy'];
    lhbtTenodesis = json['lhbt_tenodesis'];
    subacromialDecompressionBursectomy =
    json['subacromial_decompression_bursectomy'];
    acromioplasty = json['acromioplasty'];
    partialRotatorCuffRepair = json['partial_rotator_cuff_repair'];
    rotatorCuffRepair = json['rotator_cuff_repair'];
    superiorCapsularReconstruction = json['superior_capsular_reconstruction'];
    bankartRepair = json['bankart_repair'];
    bonyBankartRepair = json['bony_bankart_repair'];
    capsuleLabrumPlasty = json['capsule_labrum_plasty'];
    acJointResection = json['ac_joint_resection'];
    suprascapularNerveRelease = json['suprascapular_nerve_release'];
    axillaryNerveRelease = json['axillary_nerve_release'];
    arthroscopyLatarjetProcedure = json['arthroscopy_latarjet_procedure'];
    saOther = json['sa_other'];
    magnusonStack = json['magnuson_stack'];
    ortOther = json['ort_other'];
    shoulderArthroplastyProcedure = json['shoulder_arthroplasty_procedure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = '1';
    data['patient'] = patient;
    data['domain_management'] = domainManagement;
    data['anthroscopy_open_reduction'] = anthroscopyOpenReduction;
    data['humeral_head_size'] = humeralHeadSize;
    data['humeral_stem_size'] = humeralStemSize;
    data['glenosphere_size'] = glenosphereSize;
    data['action_plan'] = actionPlan;
    data['planned_date'] = plannedDate;
    data['progess_support_investigation'] = progessSupportInvestigation;
    data['progess_bpjs_billing'] = progessBpjsBilling;
    data['progess_anesthesia'] = progessAnesthesia;
    data['progess_complete'] = progessComplete;
    data['subacromial_injection'] = subacromialInjection;
    data['glenohumeral_injection'] = glenohumeralInjection;
    data['ac_joint_injection'] = acJointInjection;
    data['sph_suprascapular_notch'] = sphSuprascapularNotch;
    data['sph_spinoglenoid_notch'] = sphSpinoglenoidNotch;
    data['lhbt_long_axis_bg'] = lhbtLongAxisBg;
    data['lhbt_short_axis_bg'] = lhbtShortAxisBg;
    data['lhbt_rotator_interval'] = lhbtRotatorInterval;
    data['usg_guided_injection'] = usgGuidedInjection;
    data['anatomical_landmark_injection'] = anatomicalLandmarkInjection;
    data['pi_other'] = piOther;
    data['lhbt_tenotomy'] = lhbtTenotomy;
    data['lhbt_tenodesis'] = lhbtTenodesis;
    data['subacromial_decompression_bursectomy'] =
        subacromialDecompressionBursectomy;
    data['acromioplasty'] = acromioplasty;
    data['partial_rotator_cuff_repair'] = partialRotatorCuffRepair;
    data['rotator_cuff_repair'] = rotatorCuffRepair;
    data['superior_capsular_reconstruction'] =
        superiorCapsularReconstruction;
    data['bankart_repair'] = bankartRepair;
    data['bony_bankart_repair'] = bonyBankartRepair;
    data['capsule_labrum_plasty'] = capsuleLabrumPlasty;
    data['ac_joint_resection'] = acJointResection;
    data['suprascapular_nerve_release'] = suprascapularNerveRelease;
    data['axillary_nerve_release'] = axillaryNerveRelease;
    data['arthroscopy_latarjet_procedure'] = arthroscopyLatarjetProcedure;
    data['sa_other'] = saOther;
    data['magnuson_stack'] = magnusonStack;
    data['ort_other'] = ortOther;
    data['shoulder_arthroplasty_procedure'] =
        shoulderArthroplastyProcedure;
    return data;
  }
}
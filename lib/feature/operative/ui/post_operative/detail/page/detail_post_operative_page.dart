import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class DetailPostOperativePage extends StatefulWidget {
  const DetailPostOperativePage({
    Key? key,
    required this.postOperative,
  }) : super(key: key);
  final PostOperative postOperative;

  @override
  _DetailPostOperativePageState createState() =>
      _DetailPostOperativePageState();
}

class _DetailPostOperativePageState extends State<DetailPostOperativePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorTone.reLightBlack.withOpacity(0.4),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Text(
                  'Detail Post Operative',
                  style: TextStyle(
                    fontFamily: FontFamily.inter,
                    fontWeight: FontWeight.w800,
                    color: ColorTone.reDarkGrey,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      children: [
                        _infoTile("Domain Case Name",
                            widget.postOperative.domainCaseName ?? '-'),
                        _infoTile("Domain Management",
                            widget.postOperative.domainManagement ?? '-'),
                        _infoTile("Name", widget.postOperative.name ?? '-'),
                        _infoTile(
                          "Age",
                          widget.postOperative.age.toString(),
                        ),
                        _infoTile("Gender", widget.postOperative.gender ?? '-'),
                        _infoTile(
                          "Weight (KG)",
                          widget.postOperative.weight.toString(),
                        ),
                        _infoTile(
                          "Height (CM)",
                          widget.postOperative.height.toString(),
                        ),
                        _infoTile("Medical Record",
                            widget.postOperative.medicalRecord ?? '-'),
                        _infoTile("Phone Number",
                            widget.postOperative.phoneNumber ?? '-'),
                        _infoTile(
                            "Diagnosis", widget.postOperative.diagnosis ?? '-'),
                        _infoTile("Management",
                            widget.postOperative.management ?? '-'),
                        _infoTile("Registration Number",
                            widget.postOperative.registrationNumber ?? '-'),
                        _infoTile("Type", widget.postOperative.type ?? '-'),
                        _infoTile("Step", widget.postOperative.step ?? '-'),
                        _infoTile(
                            "VAS Score", widget.postOperative.vasScore ?? '-'),
                        _infoTile("Forward Flexion",
                            widget.postOperative.forwardFlexion ?? '-'),
                        _infoTile("Abduction Degree",
                            widget.postOperative.abductionDegree ?? '-'),
                        _infoTile(
                            "External Rotation Neutral",
                            widget.postOperative.externalRotationNeutral ??
                                '-'),
                        _infoTile(
                            "External Rotation 90 Abduction",
                            widget.postOperative.externalRotation90Abduction ??
                                '-'),
                        _infoTile("Internal Rotation",
                            widget.postOperative.internalRotation ?? '-'),
                        _infoTile("ASES Score",
                            widget.postOperative.asesScore ?? '-'),
                        _infoTile("DASH Score",
                            widget.postOperative.dashScore ?? '-'),
                        _infoTile("ASES Score File",
                            widget.postOperative.asesScoreFile ?? '-'),
                        _infoTile(
                            "XRay File", widget.postOperative.xRayFile ?? '-'),
                        _infoTile("CT Scan File",
                            widget.postOperative.ctScanFile ?? '-'),
                        _infoTile(
                            "MRI File", widget.postOperative.mriFile ?? '-'),
                        _infoTile("Action Plan",
                            widget.postOperative.actionPlan ?? '-'),
                        _infoTile("Planned Date",
                            widget.postOperative.plannedDate ?? '-'),
                        _infoTile(
                            "Progress Support Investigation",
                            widget.postOperative.progressSupportInvestigation ??
                                '-'),
                        _infoTile("Progress BPJS Billing",
                            widget.postOperative.progressBpjsBilling ?? '-'),
                        _infoTile("Progress Billing",
                            widget.postOperative.progressBilling ?? '-'),
                        _infoTile("Progress Anesthesia",
                            widget.postOperative.progressAnesthesia ?? '-'),
                        _infoTile("Progress Complete",
                            widget.postOperative.progressComplete ?? '-'),
                        _infoTile("Status", widget.postOperative.status ?? '-'),
                        _infoTile(
                            "Comment", widget.postOperative.comment ?? '-'),
                      ],
                    ),
                  ),
                ),
              ),
              _floatButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _floatButton() {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            child: REButton(
              colorBackground: ColorTone.reDarkGrey,
              label: 'Tutup',
              onTap: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w800),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}

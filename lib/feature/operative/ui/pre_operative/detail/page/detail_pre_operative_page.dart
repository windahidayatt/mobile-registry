import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class DetailPreOperativePage extends StatefulWidget {
  const DetailPreOperativePage({
    Key? key,
    required this.preOperative,
  }) : super(key: key);
  final PreOperative preOperative;

  @override
  _DetailPreOperativePageState createState() => _DetailPreOperativePageState();
}

class _DetailPreOperativePageState extends State<DetailPreOperativePage> {
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
                  'Detail Pre Operative',
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
                            widget.preOperative.domainCaseName ?? '-'),
                        _infoTile("Domain Management",
                            widget.preOperative.domainManagement ?? '-'),
                        _infoTile("Name", widget.preOperative.name ?? '-'),
                        _infoTile(
                          "Age",
                          widget.preOperative.age.toString(),
                        ),
                        _infoTile("Gender", widget.preOperative.gender ?? '-'),
                        _infoTile(
                          "Weight (KG)",
                          widget.preOperative.weight.toString(),
                        ),
                        _infoTile(
                          "Height (CM)",
                          widget.preOperative.height.toString(),
                        ),
                        _infoTile("Medical Record",
                            widget.preOperative.medicalRecord ?? '-'),
                        _infoTile("Phone Number",
                            widget.preOperative.phoneNumber ?? '-'),
                        _infoTile(
                            "Diagnosis", widget.preOperative.diagnosis ?? '-'),
                        _infoTile("Management",
                            widget.preOperative.management ?? '-'),
                        _infoTile("Registration Number",
                            widget.preOperative.registrationNumber ?? '-'),
                        _infoTile("Type", widget.preOperative.type ?? '-'),
                        _infoTile("Step", widget.preOperative.step ?? '-'),
                        _infoTile(
                            "VAS Score", widget.preOperative.vasScore ?? '-'),
                        _infoTile("Forward Flexion",
                            widget.preOperative.forwardFlexion ?? '-'),
                        _infoTile("Abduction Degree",
                            widget.preOperative.abductionDegree ?? '-'),
                        _infoTile("External Rotation Neutral",
                            widget.preOperative.externalRotationNeutral ?? '-'),
                        _infoTile(
                            "External Rotation 90 Abduction",
                            widget.preOperative.externalRotation90Abduction ??
                                '-'),
                        _infoTile("Internal Rotation",
                            widget.preOperative.internalRotation ?? '-'),
                        _infoTile(
                            "ASES Score", widget.preOperative.asesScore ?? '-'),
                        _infoTile(
                            "DASH Score", widget.preOperative.dashScore ?? '-'),
                        _infoTile("ASES Score File",
                            widget.preOperative.asesScoreFile ?? '-'),
                        _infoTile(
                            "XRay File", widget.preOperative.xRayFile ?? '-'),
                        _infoTile("CT Scan File",
                            widget.preOperative.ctScanFile ?? '-'),
                        _infoTile(
                            "MRI File", widget.preOperative.mriFile ?? '-'),
                        _infoTile("Action Plan",
                            widget.preOperative.actionPlan ?? '-'),
                        _infoTile("Planned Date",
                            widget.preOperative.plannedDate ?? '-'),
                        _infoTile(
                            "Progress Support Investigation",
                            widget.preOperative.progressSupportInvestigation ??
                                '-'),
                        _infoTile("Progress BPJS Billing",
                            widget.preOperative.progressBpjsBilling ?? '-'),
                        _infoTile("Progress Billing",
                            widget.preOperative.progressBilling ?? '-'),
                        _infoTile("Progress Anesthesia",
                            widget.preOperative.progressAnesthesia ?? '-'),
                        _infoTile("Progress Complete",
                            widget.preOperative.progressComplete ?? '-'),
                        _infoTile("Status", widget.preOperative.status ?? '-'),
                        _infoTile(
                            "Comment", widget.preOperative.comment ?? '-'),
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

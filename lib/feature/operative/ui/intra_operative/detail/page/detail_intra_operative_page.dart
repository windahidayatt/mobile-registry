import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class DetailIntraOperativePage extends StatefulWidget {
  const DetailIntraOperativePage({
    Key? key,
    required this.intraOperative,
  }) : super(key: key);
  final IntraOperative intraOperative;

  @override
  _DetailIntraOperativePageState createState() =>
      _DetailIntraOperativePageState();
}

class _DetailIntraOperativePageState extends State<DetailIntraOperativePage> {
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
                  'Detail Intra Operative',
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
                            widget.intraOperative.domainCaseName ?? '-'),
                        _infoTile("Domain Management",
                            widget.intraOperative.domainManagement ?? '-'),
                        _infoTile("Name", widget.intraOperative.name ?? '-'),
                        _infoTile(
                          "Age",
                          widget.intraOperative.age.toString(),
                        ),
                        _infoTile(
                            "Gender", widget.intraOperative.gender ?? '-'),
                        _infoTile(
                          "Weight (KG)",
                          widget.intraOperative.weight.toString(),
                        ),
                        _infoTile(
                          "Height (CM)",
                          widget.intraOperative.height.toString(),
                        ),
                        _infoTile("Medical Record",
                            widget.intraOperative.medicalRecord ?? '-'),
                        _infoTile("Phone Number",
                            widget.intraOperative.phoneNumber ?? '-'),
                        _infoTile("Diagnosis",
                            widget.intraOperative.diagnosis ?? '-'),
                        _infoTile("Management",
                            widget.intraOperative.management ?? '-'),
                        _infoTile("Registration Number",
                            widget.intraOperative.registrationNumber ?? '-'),
                        _infoTile("Type", widget.intraOperative.type ?? '-'),
                        _infoTile("Step", widget.intraOperative.step ?? '-'),
                        _infoTile(
                            "Anthroscopy Oopen Reduction",
                            widget.intraOperative.anthroscopyOpenReduction ??
                                '-'),
                        _infoTile("Anchor Use",
                            widget.intraOperative.anchorUse ?? '-'),
                        _infoTile("Humeral Head Size",
                            widget.intraOperative.humeralHeadSize ?? '-'),
                        _infoTile("Humeral Stem Size",
                            widget.intraOperative.humeralStemSize ?? '-'),
                        _infoTile("Glenosphere Size",
                            widget.intraOperative.glenosphereSize ?? '-'),
                        _infoTile("Action Plan",
                            widget.intraOperative.actionPlan ?? '-'),
                        _infoTile("Planned Date",
                            widget.intraOperative.plannedDate ?? '-'),
                        _infoTile(
                            "Progress Support Investigation",
                            widget.intraOperative
                                    .progressSupportInvestigation ??
                                '-'),
                        _infoTile("Progress BPJS Billing",
                            widget.intraOperative.progressBpjsBilling ?? '-'),
                        _infoTile("Progress Billing",
                            widget.intraOperative.progressBilling ?? '-'),
                        _infoTile("Progress Anesthesia",
                            widget.intraOperative.progressAnesthesia ?? '-'),
                        _infoTile("Progress Complete",
                            widget.intraOperative.progressComplete ?? '-'),
                        _infoTile(
                            "Status", widget.intraOperative.status ?? '-'),
                        _infoTile(
                            "Comment", widget.intraOperative.comment ?? '-'),
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

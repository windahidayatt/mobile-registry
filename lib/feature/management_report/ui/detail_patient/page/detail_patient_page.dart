import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/feature/management_report/ui/detail_patient/controller/detail_patient_controller.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/components/dialog/confirm_delete.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class DetailPatientPage extends StatefulWidget {
  const DetailPatientPage({
    Key? key,
    required this.patient,
  }) : super(key: key);
  final Patient patient;

  @override
  _DetailPatientPageState createState() => _DetailPatientPageState();
}

class _DetailPatientPageState extends State<DetailPatientPage> {
  final DetailPatientController _controller = sl();
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
                child: Row(
                  children: [
                    Text(
                      'Detail Patient',
                      style: TextStyle(
                        fontFamily: FontFamily.inter,
                        fontWeight: FontWeight.w800,
                        color: ColorTone.reDarkGrey,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                    _actionButton()
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      children: [
                        _infoTile("Domain Management",
                            widget.patient.domainManagement),
                        _infoTile("Name", widget.patient.name),
                        _infoTile("Age", widget.patient.age.toString()),
                        _infoTile("Gender", widget.patient.gender),
                        _infoTile(
                            "Weight (KG)", widget.patient.weight.toString()),
                        _infoTile(
                            "Height (CM)", widget.patient.height.toString()),
                        _infoTile("Hospital", widget.patient.hospital),
                        _infoTile(
                            "Medical Record", widget.patient.medicalRecord),
                        _infoTile("Phone Number", widget.patient.phoneNumber),
                        _infoTile("Diagnosis", widget.patient.diagnosis),
                        _infoTile("Management", widget.patient.management),
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

  Widget _actionButton() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            _controller.isEditable(!_controller.isEditable.value);
          },
          child: Obx(
            () => Icon(
              Icons.edit,
              color: (!_controller.isEditable.value)
                  ? ColorTone.reDarkGrey
                  : ColorTone.reOrange,
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        GestureDetector(
          onTap: (){
            Get.dialog(const ConfirmDelete(
              onCancel: null,
              onDelete: null,
            ));
          },
          child: const Icon(
            Icons.delete,
            color: ColorTone.reDarkGrey,
          ),
        ),
      ],
    );
  }

  Widget _floatButton() {
    return Padding(
      padding: EdgeInsets.all(2.h),
      child: Row(
        children: [
          Expanded(
            child: REButton(
              colorBackground: ColorTone.reDarkGrey,
              label: 'Tutup',
              onTap: () => Get.back(),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Obx(
              () => REButton(
                label: 'Simpan',
                colorBackground:
                    (!_controller.isEditable.value) ? ColorTone.reGrey : null,
                colorText: (!_controller.isEditable.value)
                    ? ColorTone.reDarkGrey
                    : null,
                onTap: () => Get.back(),
              ),
            ),
          )
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

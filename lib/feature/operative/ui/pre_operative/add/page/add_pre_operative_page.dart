import 'package:flutter/material.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/add/controller/add_pre_operative_controller.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/components/form/re_date_picker.dart';
import 'package:mobile_registry/shared_library/components/form/re_file_field.dart';
import 'package:mobile_registry/shared_library/components/form/re_switch.dart';
import 'package:mobile_registry/shared_library/components/form/re_text_field.dart';
import 'package:mobile_registry/shared_library/components/form/re_text_field_area.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class AddPreOperativePage extends StatefulWidget {
  const AddPreOperativePage({Key? key}) : super(key: key);

  @override
  _AddPreOperativePageState createState() => _AddPreOperativePageState();
}

class _AddPreOperativePageState extends State<AddPreOperativePage> {
  final AddPreOperativeController _controller = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTone.reDarkGrey,
        title: const Text('Add Pre Operative Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _paddingWrapper(
              child: RETextField(
                controller: _controller.patientController,
                label: "Patient Identity",
                validator: null,
                prefixIcon: const Icon(
                  Icons.person,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: TextEditingController(),
                label: "Operative Type",
                validator: null,
                prefixIcon: const Icon(
                  Icons.health_and_safety,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: TextEditingController(),
                label: "VAS Score",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: _controller.forwardFlexionController,
                label: "Forward Flexion (Degree/Range of Motion)",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: _controller.abductionController,
                label: "Abduction 0-60°",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: _controller.externalRotationNeutralController,
                label: "External Rotation in Neutral (Degree/Range of Motion)",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: _controller.externalRotationAbductionController,
                label:
                    "External Rotation 90 Abduction (Degree/Range of Motion)",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: _controller.internalRotationController,
                label: "Internal Rotation",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: _controller.americanScoreController,
                label: "American Shoulder-Elbow Score (ASES Score)",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: RETextField(
                controller: _controller.dashScoreController,
                label: "DASH Score",
                validator: null,
                prefixIcon: const Icon(
                  Icons.score,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: const REFileField(
                label: 'ASES Score',
                fileName: 'File.pdf',
              ),
            ),
            _paddingWrapper(
              child: const REFileField(
                label: 'X-Ray Investigation',
                fileName: 'File.pdf',
              ),
            ),
            _paddingWrapper(
              child: const REFileField(
                label: 'CT-Scan Investigation',
                fileName: 'File.pdf',
              ),
            ),
            _paddingWrapper(
              child: const REFileField(
                label: 'MRI Investigation',
                fileName: 'File.pdf',
              ),
            ),
            _paddingWrapper(
              child: RETextFieldArea(
                controller: _controller.actionPlanController,
                label: "Action Plan",
                validator: null,
                prefixIcon: const Icon(
                  Icons.note,
                  color: ColorTone.reDarkGrey,
                ),
              ),
            ),
            _paddingWrapper(
              child: REDatePicker(
                onChanged: (value){},
              ),
            ),
            _paddingWrapper(
              child: const RESwitch(
                value: false,
                label: 'Supporting Investigation',
              ),
            ),
            _paddingWrapper(
              child: const RESwitch(
                value: false,
                label: 'BPJS Billing',
              ),
            ),
            _paddingWrapper(
              child: const RESwitch(
                value: false,
                label: 'Anesthesia',
              ),
            ),
            _paddingWrapper(
              child: const RESwitch(
                value: false,
                label: 'Complete',
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: REButton(
                      label: 'Add',
                      onTap: () => null,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _paddingWrapper({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: child,
    );
  }
}

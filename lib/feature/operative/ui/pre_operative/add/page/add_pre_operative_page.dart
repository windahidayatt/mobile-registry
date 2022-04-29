import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/add/controller/add_pre_operative_controller.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/components/form/re_date_picker.dart';
import 'package:mobile_registry/shared_library/components/form/re_file_field.dart';
import 'package:mobile_registry/shared_library/components/form/re_switch.dart';
import 'package:mobile_registry/shared_library/components/form/re_text_field.dart';
import 'package:mobile_registry/shared_library/components/form/re_text_field_area.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';
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
  void initState() {
    _controller.getPrePatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTone.reDarkGrey,
        title: const Text('Add Pre Operative Page'),
        centerTitle: true,
      ),
      body: Obx(() {
        switch (_controller.viewState.value.status) {
          case Status.INITIAL:
            return const Center(
              child: EmptyState(),
            );
          case Status.LOADING:
            return const Center(
              child: SELoadingPage(),
            );
          case Status.COMPLETED:
            return ListView(
              children: [
                _paddingWrapper(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: const Text("Operative Type"),
                    items: _controller.listTypes.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) =>
                        {_controller.operativeType(value ?? '')},
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: const Icon(Icons.health_and_safety),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            const BorderSide(color: ColorTone.reDarkGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                            const BorderSide(color: ColorTone.reDarkGrey),
                      ),
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: const Text("Patient Identity"),
                    items: _controller.listPatients.map((value) {
                      return DropdownMenuItem(
                        child: Text(value.patientInfo),
                        value: value.patientInfo,
                      );
                    }).toList(),
                    onChanged: (value) {
                      _controller.patientIdentity(value ?? '');
                    },
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                        const BorderSide(color: ColorTone.reDarkGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide:
                        const BorderSide(color: ColorTone.reDarkGrey),
                      ),
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: RETextField(
                    controller: _controller.vasScoreController,
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
                    label:
                        "External Rotation in Neutral (Degree/Range of Motion)",
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
                _shoulderSpecialForm(),
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
                    onChanged: (value) {},
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.isSupportingInvestigation.value,
                    label: 'Supporting Investigation',
                    onChanged: (value) =>
                        _controller.isSupportingInvestigation(value),
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.billingByBPJS.value,
                    label: 'BPJS Billing',
                    onChanged: (value) => _controller.billingByBPJS(value),
                  ),
                ),
                _progressBilling(),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.anesthesia.value,
                    label: 'Anesthesia',
                    onChanged: (value) => _controller.anesthesia(value),
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.complete.value,
                    label: 'Complete',
                    onChanged: (value) => _controller.complete(value),
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
                          onTap: () => _controller.addPreOperative(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          case Status.ERROR:
            return Center(
              child: SEErrorPage(
                message: _controller.viewState.value.message,
                onRefresh: () {
                  _controller.getPrePatients();
                },
              ),
            );
        }
      }),
    );
  }

  Widget _paddingWrapper({required Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: child,
    );
  }

  Widget _progressBilling() => (!_controller.billingByBPJS.value)
      ? _paddingWrapper(
          child: RETextField(
            controller: _controller.progressBillingController,
            label: "Other Billing",
            validator: null,
            prefixIcon: const Icon(
              Icons.score,
              color: ColorTone.reDarkGrey,
            ),
          ),
        )
      : const SizedBox.shrink();

  Widget _shoulderSpecialForm() => (_controller.operativeType.value ==
          'Shoulder')
      ? Column(
          children: [
            _paddingWrapper(
              child: RESwitch(
                value: _controller.shoulderNeer.value,
                label: 'Shoulder Neer Test',
                onChanged: (value) => _controller.shoulderNeer(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.shoulderJobe.value,
                label: 'Shoulder Jobe Test',
                onChanged: (value) => _controller.shoulderJobe(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.shoulderHawkins.value,
                label: 'Shoulder Hawkins Test',
                onChanged: (value) => _controller.shoulderHawkins(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.externalRotationLag.value,
                label: 'External Rotation Lag Test',
                onChanged: (value) => _controller.externalRotationLag(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.hornblower.value,
                label: 'Hornblower Test',
                onChanged: (value) => _controller.hornblower(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.bellyPress.value,
                label: 'Belly Press Test',
                onChanged: (value) => _controller.bellyPress(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.bellyOff.value,
                label: 'Belly Off Test',
                onChanged: (value) => _controller.bellyOff(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.liftOff.value,
                label: 'Lift Off Test',
                onChanged: (value) => _controller.liftOff(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.bearHug.value,
                label: 'Bear Hug Test',
                onChanged: (value) => _controller.bearHug(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.obrient.value,
                label: "O'Brient Test",
                onChanged: (value) => _controller.obrient(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.throwing.value,
                label: 'Throwing Test',
                onChanged: (value) => _controller.throwing(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.speed.value,
                label: 'Speed Test',
                onChanged: (value) => _controller.speed(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.anteriorApprehension.value,
                label: 'Anterior Apprehension Test',
                onChanged: (value) => _controller.anteriorApprehension(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.posteriorApprehension.value,
                label: 'Posterior Apprehension Test',
                onChanged: (value) => _controller.posteriorApprehension(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.loadShift.value,
                label: 'Load Shift Test',
                onChanged: (value) => _controller.loadShift(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.sulcusSign.value,
                label: 'Sulcus Sign',
                onChanged: (value) => _controller.sulcusSign(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.posteriorJerk.value,
                label: 'Posterior Jerk Test',
                onChanged: (value) => _controller.posteriorJerk(value),
              ),
            ),
          ],
        )
      : const SizedBox.shrink();
}

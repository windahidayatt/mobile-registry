import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/add/controller/add_intra_operative_controller.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/components/form/re_date_picker.dart';
import 'package:mobile_registry/shared_library/components/form/re_switch.dart';
import 'package:mobile_registry/shared_library/components/form/re_text_field.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class AddIntraOperativePage extends StatefulWidget {
  const AddIntraOperativePage({Key? key}) : super(key: key);

  @override
  _AddIntraOperativePageState createState() => _AddIntraOperativePageState();
}

class _AddIntraOperativePageState extends State<AddIntraOperativePage> {
  final AddIntraOperativeController _controller = sl();

  @override
  void initState() {
    _controller.getIntraPatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTone.reDarkGrey,
        title: const Text('Add Intra Operative Page'),
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
                    controller: _controller.anthroscopyOpenController,
                    label: "Anthroscopy Open Reduction",
                    validator: null,
                    prefixIcon: const Icon(
                      Icons.score,
                      color: ColorTone.reDarkGrey,
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    hint: const Text("Domain Management"),
                    items: _controller.listDomainManagement.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) =>
                    {_controller.domainManagement(value ?? '')},
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
                  child: RETextField(
                    controller: _controller.humeralHeadSizeController,
                    label: "Humeral Head Size",
                    validator: null,
                    prefixIcon: const Icon(
                      Icons.score,
                      color: ColorTone.reDarkGrey,
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: RETextField(
                    controller: _controller.humeralStemSizeController,
                    label: "Humeral Stem Size",
                    validator: null,
                    prefixIcon: const Icon(
                      Icons.score,
                      color: ColorTone.reDarkGrey,
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: RETextField(
                    controller: _controller.glenosphereSizeController,
                    label: "Glenosphere Size",
                    validator: null,
                    prefixIcon: const Icon(
                      Icons.score,
                      color: ColorTone.reDarkGrey,
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: RETextField(
                    controller: _controller.actionPlanController,
                    label: "Action Plan",
                    validator: null,
                    prefixIcon: const Icon(
                      Icons.score,
                      color: ColorTone.reDarkGrey,
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: REDatePicker(
                    onChanged: (value) => _controller.plannedDate(
                      value.toString(),
                    ),
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.isSupportingInvestigation.value,
                    label: 'Progress Support Investigation',
                    onChanged: (value) =>
                        _controller.isSupportingInvestigation(value),
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.billingByBPJS.value,
                    label: 'Progress BPJS Billing',
                    onChanged: (value) => _controller.billingByBPJS(value),
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.anesthesia.value,
                    label: 'Progress Anesthesia',
                    onChanged: (value) => _controller.anesthesia(value),
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.complete.value,
                    label: 'Progress Complete',
                    onChanged: (value) => _controller.complete(value),
                  ),
                ),
                _optionPainIntervention(),
                _optionShoulderArthroscopy(),
                _optionOpenReductionInternalFixation(),
                _optionShoulderArthroplasty(),
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
                          onTap: () => _controller.addIntraOperative(),
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
                  _controller.getIntraPatients();
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

  Widget _optionPainIntervention() => (_controller.domainManagement.value ==
          'Pain Intervention')
      ? Column(
          children: [
            _paddingWrapper(
              child: RESwitch(
                value: _controller.subacromialInjection.value,
                label: 'Subacromial Injection',
                onChanged: (value) => _controller.subacromialInjection(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.glenohumeralInjection.value,
                label: 'Glenohumeral Injection',
                onChanged: (value) => _controller.glenohumeralInjection(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.acJointInjection.value,
                label: 'AC Joint Injection',
                onChanged: (value) => _controller.acJointInjection(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.suprascapularNotch.value,
                label: 'SPH Suprascapular Notch',
                onChanged: (value) => _controller.suprascapularNotch(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.spinoglenoidNotch.value,
                label: 'SPH Spinoglenoid Notch',
                onChanged: (value) => _controller.spinoglenoidNotch(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.longAxisBg.value,
                label: 'LHBT Long Axis Bg',
                onChanged: (value) => _controller.longAxisBg(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.shortAxisBg.value,
                label: 'LHBT Short Axis Bg',
                onChanged: (value) => _controller.shortAxisBg(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.rotatorInterval.value,
                label: 'LHBT Rotator Interval',
                onChanged: (value) => _controller.rotatorInterval(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.guidedInjection.value,
                label: 'USG Guided Injection',
                onChanged: (value) => _controller.guidedInjection(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.anatomicalLandmarkInjection.value,
                label: 'Anatomical Landmark Injection',
                onChanged: (value) =>
                    _controller.anatomicalLandmarkInjection(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.piOther.value,
                label: 'Pi Other',
                onChanged: (value) => _controller.piOther(value),
              ),
            ),
          ],
        )
      : const SizedBox.shrink();

  Widget _optionShoulderArthroscopy() => (_controller.domainManagement.value ==
          'Shoulder Arthroscopy')
      ? Column(
          children: [
            _paddingWrapper(
              child: RESwitch(
                value: _controller.lhbtTenotomy.value,
                label: 'LHBT Tenotomy',
                onChanged: (value) => _controller.lhbtTenotomy(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.lhbtTenodesis.value,
                label: 'LHBT Tenodesis',
                onChanged: (value) => _controller.lhbtTenodesis(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.subacromialDecompressionBursectomy.value,
                label: 'Subacromial Decompression Bursectomy',
                onChanged: (value) =>
                    _controller.subacromialDecompressionBursectomy(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.acromioplasty.value,
                label: 'Acromioplasty',
                onChanged: (value) => _controller.acromioplasty(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.partialRotatorCuffRepair.value,
                label: 'Partial Rotator Cuff Repair',
                onChanged: (value) =>
                    _controller.partialRotatorCuffRepair(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.rotatorCuffRepair.value,
                label: 'Rotator Cuff Repair',
                onChanged: (value) => _controller.rotatorCuffRepair(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.superiorCapsularReconstruction.value,
                label: 'Superior Capsular Reconstruction',
                onChanged: (value) =>
                    _controller.superiorCapsularReconstruction(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.bankartRepair.value,
                label: 'Bankart Repair',
                onChanged: (value) => _controller.bankartRepair(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.bonyBankartRepair.value,
                label: 'Bony Bankart Repair',
                onChanged: (value) => _controller.bonyBankartRepair(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.capsuleLabrumPlasty.value,
                label: 'Capsule Labrum Plasty',
                onChanged: (value) => _controller.capsuleLabrumPlasty(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.acJointResection.value,
                label: 'AC Joint Resection',
                onChanged: (value) => _controller.acJointResection(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.suprascapularNerveRelease.value,
                label: 'Suprascapular Nerve Release',
                onChanged: (value) =>
                    _controller.suprascapularNerveRelease(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.axillaryNerveRelease.value,
                label: 'Axillary Nerve Release',
                onChanged: (value) => _controller.axillaryNerveRelease(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.arthroscopyLatarjetProcedure.value,
                label: 'Arthroscopy Latarjet Procedure',
                onChanged: (value) =>
                    _controller.arthroscopyLatarjetProcedure(value),
              ),
            ),
            _paddingWrapper(
              child: RESwitch(
                value: _controller.saOther.value,
                label: 'SA Other',
                onChanged: (value) => _controller.saOther(value),
              ),
            ),
          ],
        )
      : const SizedBox.shrink();

  Widget _optionOpenReductionInternalFixation() =>
      (_controller.domainManagement.value == 'Open Reduction Internal Fixation')
          ? Column(
              children: [
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.magnusonStack.value,
                    label: 'Magnuson Stack',
                    onChanged: (value) => _controller.magnusonStack(value),
                  ),
                ),
                _paddingWrapper(
                  child: RESwitch(
                    value: _controller.ortOther.value,
                    label: 'Ort Other',
                    onChanged: (value) => _controller.ortOther(value),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink();

  Widget _optionShoulderArthroplasty() =>
      (_controller.domainManagement.value == 'Shoulder Arthroplasty')
          ? _paddingWrapper(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                hint: const Text("Shoulder Arthroplasty Procedure"),
                items:
                    _controller.listShoulderArthroplastyProcedure.map((value) {
                  return DropdownMenuItem(
                    child: Text(value),
                    value: value,
                  );
                }).toList(),
                onChanged: (value) =>
                    {_controller.shoulderArthroplastyProcedure(value ?? '')},
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: const Icon(Icons.health_and_safety),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: ColorTone.reDarkGrey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(color: ColorTone.reDarkGrey),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink();
}

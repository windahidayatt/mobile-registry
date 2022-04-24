import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mobile_registry/feature/management_report/ui/add_patient/controller/add_patient_controller.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/components/form/re_text_field.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  final AddPatientController _controller = sl();

  @override
  void initState() {
    _controller.getDomainCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTone.reDarkGrey,
        title: const Text('Add Patient'),
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  _paddingWrapper(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      hint: const Text("Domain Case"),
                      value: _controller.domainCase,
                      items: _controller.listDomainCase.map((value) {
                        return DropdownMenuItem(
                          child: Text(value.name),
                          value: value.name,
                        );
                      }).toList(),
                      onChanged: (value) {
                        _controller.domainCase = value ?? '';
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Domain Case",
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
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      hint: const Text("Domain Management"),
                      value: _controller.domainManagement,
                      items: _controller.listDomainManagement.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        _controller.domainManagement = value ?? '';
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Domain Management",
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
                      controller: _controller.nameText,
                      label: "Name",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
                    ),
                  ),
                  _paddingWrapper(
                    child: RETextField(
                      controller: _controller.ageText,
                      label: "Age",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
                    ),
                  ),
                  _paddingWrapper(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      hint: const Text("Gender"),
                      value: _controller.gender,
                      items: _controller.listGender.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        _controller.gender = value ?? '';
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Gender",
                        prefixIcon: const Icon(
                          Icons.person,
                          color: ColorTone.reDarkGrey,
                        ),
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
                      controller: _controller.weightText,
                      label: "Weight (kg)",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
                    ),
                  ),
                  _paddingWrapper(
                    child: RETextField(
                      controller: _controller.heightText,
                      label: "Height (cm)",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
                    ),
                  ),
                  _paddingWrapper(
                    child: DropdownButtonFormField<String>(
                      isExpanded: true,
                      hint: const Text("Hospital"),
                      value: _controller.hospital,
                      items: _controller.listHospital.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        _controller.hospital = value ?? '';
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: "Hospital",
                        prefixIcon: const Icon(
                          Icons.person,
                          color: ColorTone.reDarkGrey,
                        ),
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
                      controller: _controller.medicalRecordText,
                      label: "Medical Record",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
                    ),
                  ),
                  _paddingWrapper(
                    child: RETextField(
                      controller: _controller.phoneText,
                      label: "Phone Number",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
                    ),
                  ),
                  _paddingWrapper(
                    child: RETextField(
                      controller: _controller.diagnosticText,
                      label: "Diagnosis",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
                    ),
                  ),
                  _paddingWrapper(
                    child: RETextField(
                      controller: _controller.managementText,
                      label: "Management",
                      validator: null,
                      prefixIcon: const Icon(
                        Icons.person,
                        color: ColorTone.reDarkGrey,
                      ),
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
                            onTap: () => _controller.addPatient(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          case Status.ERROR:
            return Center(
              child: SEErrorPage(
                message: _controller.viewState.value.message,
                onRefresh: () {
                  _controller.getDomainCase();
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
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/management_report/domain/entities/patient.dart';
import 'package:mobile_registry/feature/management_report/ui/detail_patient/page/detail_patient_page.dart';
import 'package:mobile_registry/feature/management_report/ui/patient_data/controller/patient_data_controller.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class PatientDataPage extends StatefulWidget {
  const PatientDataPage({Key? key}) : super(key: key);

  @override
  _PatientDataPageState createState() => _PatientDataPageState();
}

class _PatientDataPageState extends State<PatientDataPage> {
  final PatientDataController _controller = sl();

  @override
  void initState() {
    _controller.getPatientsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return ListView.builder(
              itemCount: _controller.listPatient.length,
              itemBuilder: (context, index) {
                return _patientCard(_controller.listPatient[index]);
                /*
                return InfoPatientWidget(
                    title: _controller.listPatient[index].name,
                    subTitle: _controller.listPatient[index].domainManagement,
                    childSubTitle: _controller.listPatient[index].hospital,
                    rightContent: _controller.listPatient[index].management,
                    subRightContent: _controller.listPatient[index].gender);*/
              },
            );
          case Status.ERROR:
            return Center(
              child: SEErrorPage(
                message: _controller.viewState.value.message,
                onRefresh: () {
                  _controller.getPatientsData();
                },
              ),
            );
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  _navigateToDetailPage(Patient patient) {
    Get.dialog(
      DetailPatientPage(patient: patient),
    );
  }

  Widget _patientCard(Patient patient) {
    return GestureDetector(
      onTap: () {
        _navigateToDetailPage(patient);
      },
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      patient.domainManagement,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      patient.hospital,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(patient.management),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 8.0),
                      child: Text(
                        patient.gender,
                        style: const TextStyle(color: ColorTone.reWhite),
                      ),
                      decoration: BoxDecoration(
                          color: (patient.gender.toUpperCase() ==
                                  'Male'.toUpperCase())
                              ? ColorTone.reBlue
                              : ColorTone.reOrange,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

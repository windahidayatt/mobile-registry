import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/management_report/ui/patient_data/controller/patient_data_controller.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';

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
                  return Text(_controller.listPatient[index].name);
                });
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
    );
  }
}

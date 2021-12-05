import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/management_report/ui/patient_data/controller/patient_data_controller.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/se_error.dart';
import 'package:mobile_registry/shared_library/state/se_loading.dart';

class PatientDataPage extends StatefulWidget {
  const PatientDataPage({Key? key}) : super(key: key);

  @override
  _PatientDataPageState createState() => _PatientDataPageState();
}

class _PatientDataPageState extends State<PatientDataPage> {
  final PatientDataController _controller = sl();

  @override
  void initState() {
    super.initState();
    _controller.getPatientsData();
    ever(_controller.viewState, (ViewState value){
      if(value.status == Status.LOADING){
        Get.dialog(const SELoading());
      }

      if(value.status == Status.ERROR){
        SEError.show(error: value.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Patient Data Page'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/controller/intra_operative_controller.dart';
import 'package:mobile_registry/shared_library/components/card/info_patient_widget.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';

class IntraOperativePage extends StatefulWidget {
  const IntraOperativePage({Key? key}) : super(key: key);

  @override
  _IntraOperativePageState createState() => _IntraOperativePageState();
}

class _IntraOperativePageState extends State<IntraOperativePage> {
  final IntraOperativeController _controller = sl();

  @override
  void initState() {
    _controller.getIntraOperativesData();
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
                itemCount: _controller.listIntraOperative.length,
                itemBuilder: (context, index) {
                  return InfoPatientWidget(
                    title: _controller.listIntraOperative[index].name,
                    subTitle: _controller.listIntraOperative[index].domainCaseName,
                    childSubTitle: _controller.listIntraOperative[index].hospital,
                    rightContent: _controller.listIntraOperative[index].management,
                    subRightContent: _controller.listIntraOperative[index].gender,
                  );
                });
          case Status.ERROR:
            return Center(
              child: SEErrorPage(
                message: _controller.viewState.value.message,
                onRefresh: () {
                  _controller.getIntraOperativesData();
                },
              ),
            );
        }
      }),
    );
  }
}

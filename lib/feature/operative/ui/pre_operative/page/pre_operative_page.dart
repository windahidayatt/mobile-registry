import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/controller/pre_operative_controller.dart';
import 'package:mobile_registry/shared_library/components/card/info_patient_widget.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';

class PreOperativePage extends StatefulWidget {
  const PreOperativePage({Key? key}) : super(key: key);

  @override
  _PreOperativePageState createState() => _PreOperativePageState();
}

class _PreOperativePageState extends State<PreOperativePage> {
  final PreOperativeController _controller = sl();

  @override
  void initState() {
    _controller.getPreOperativesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
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
                  itemCount: _controller.listPreOperative.length,
                  itemBuilder: (context, index) {
                    return InfoPatientWidget(
                      title: _controller.listPreOperative[index].name,
                      subTitle: _controller.listPreOperative[index].domainCaseName,
                      childSubTitle: _controller.listPreOperative[index].hospital,
                      rightContent: _controller.listPreOperative[index].management,
                      subRightContent: _controller.listPreOperative[index].gender,
                    );
                  });
            case Status.ERROR:
              return Center(
                child: SEErrorPage(
                  message: _controller.viewState.value.message,
                  onRefresh: () {
                    _controller.getPreOperativesData();
                  },
                ),
              );
          }
        },
      ),
    );
  }
}

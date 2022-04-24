import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/controller/post_operative_controller.dart';
import 'package:mobile_registry/shared_library/components/card/info_patient_widget.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';

class PostOperativePage extends StatefulWidget {
  const PostOperativePage({Key? key}) : super(key: key);

  @override
  _PostOperativePageState createState() => _PostOperativePageState();
}

class _PostOperativePageState extends State<PostOperativePage> {
  final PostOperativeController _controller = sl();

  @override
  void initState() {
    _controller.getPostOperativesData();
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
                  itemCount: _controller.listPostOperative.length,
                  itemBuilder: (context, index) {
                    return InfoPatientWidget(
                      title: _controller.listPostOperative[index].name,
                      subTitle: _controller.listPostOperative[index].domainCaseName,
                      childSubTitle: 'Medical Record: ${_controller.listPostOperative[index].medicalRecord}',
                      rightContent: _controller.listPostOperative[index].management,
                      subRightContent: _controller.listPostOperative[index].gender,
                    );
                  });
            case Status.ERROR:
              return Center(
                child: SEErrorPage(
                  message: _controller.viewState.value.message,
                  onRefresh: () {
                    _controller.getPostOperativesData();
                  },
                ),
              );
          }
        },
      ),
    );
  }
}

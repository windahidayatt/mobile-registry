import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/post_operative.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/dashboard/controller/post_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/detail/page/detail_post_operative_page.dart';
import 'package:mobile_registry/shared_library/components/card/info_patient_widget.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

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
              return RefreshIndicator(
                child: ListView.builder(
                    itemCount: _controller.listPostOperative.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _navigateToDetailPage(
                            _controller.listPostOperative[index]),
                        child: Slidable(
                          endActionPane: ActionPane(
                            key: ValueKey(index),
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (_) => {},
                                backgroundColor: ColorTone.reGreen,
                                foregroundColor: Colors.white,
                                icon: Icons.edit,
                                label: 'Edit',
                              ),
                              SlidableAction(
                                onPressed: (_) => _controller
                                    .deletePostOperativeData(_controller
                                            .listPostOperative[index].id ??
                                        ''),
                                backgroundColor: ColorTone.reRed,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              )
                            ],
                          ),
                          child: InfoPatientWidget(
                            title: _controller.listPostOperative[index].name ??
                                '-',
                            subTitle: _controller
                                    .listPostOperative[index].domainCaseName ??
                                '-',
                            childSubTitle:
                                'Medical Record: ${_controller.listPostOperative[index].medicalRecord}',
                            rightContent: _controller
                                    .listPostOperative[index].management ??
                                '-',
                            subRightContent:
                                _controller.listPostOperative[index].gender ??
                                    '-',
                          ),
                        ),
                      );
                    }),
                onRefresh: () => _controller.getPostOperativesData(),
              );
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _navigateToAddPostOperativePage(),
      ),
    );
  }

  void _navigateToAddPostOperativePage() =>
      Get.toNamed(Constants.reRoute.addIntraOperative);

  void _navigateToDetailPage(PostOperative postOperative) => Get.dialog(
        DetailPostOperativePage(postOperative: postOperative),
      );
}

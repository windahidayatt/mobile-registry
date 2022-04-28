import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/operative/domain/entities/pre_operative.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/dashboard/controller/pre_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/detail/page/detail_pre_operative_page.dart';
import 'package:mobile_registry/shared_library/components/card/info_patient_widget.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

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
              return RefreshIndicator(
                child: ListView.builder(
                    itemCount: _controller.listPreOperative.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => _navigateToDetailPage(
                            _controller.listPreOperative[index]),
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
                                    .deletePreOperativeData(_controller
                                            .listPreOperative[index].id ??
                                        ''),
                                backgroundColor: ColorTone.reRed,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              )
                            ],
                          ),
                          child: InfoPatientWidget(
                            title:
                                _controller.listPreOperative[index].name ?? '-',
                            subTitle: _controller
                                    .listPreOperative[index].domainCaseName ??
                                '-',
                            childSubTitle:
                                'Medical Record: ${_controller.listPreOperative[index].medicalRecord}',
                            rightContent: _controller
                                    .listPreOperative[index].management ??
                                '-',
                            subRightContent:
                                _controller.listPreOperative[index].gender ??
                                    '-',
                          ),
                        ),
                      );
                    }),
                onRefresh: () => _controller.getPreOperativesData(),
              );
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _navigateToAddPreOperativePage(),
      ),
    );
  }

  void _navigateToAddPreOperativePage() =>
      Get.toNamed(Constants.reRoute.addPreOperative);

  void _navigateToDetailPage(PreOperative preOperative) => Get.dialog(
        DetailPreOperativePage(preOperative: preOperative),
      );
}

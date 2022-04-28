import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mobile_registry/domain/operative/domain/entities/intra_operative.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/dashboard/controller/intra_operative_controller.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/detail/page/detail_intra_operative_page.dart';
import 'package:mobile_registry/shared_library/components/card/info_patient_widget.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/empty_state.dart';
import 'package:mobile_registry/shared_library/state/se_error_page.dart';
import 'package:mobile_registry/shared_library/state/se_loading_page.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

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
                    itemCount: _controller.listIntraOperative.length,
                    itemBuilder: (context, index) {
                      return Slidable(
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
                                  .deleteIntraOperativeData(_controller
                                          .listIntraOperative[index].id ??
                                      ''),
                              backgroundColor: ColorTone.reRed,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            )
                          ],
                        ),
                        child: InfoPatientWidget(
                          onTap: () => _navigateToDetailPage(
                              _controller.listIntraOperative[index]),
                          title:
                              _controller.listIntraOperative[index].name ?? '-',
                          subTitle: _controller
                                  .listIntraOperative[index].domainCaseName ??
                              '-',
                          childSubTitle:
                              'Medical Record: ${_controller.listIntraOperative[index].medicalRecord}',
                          rightContent: _controller
                                  .listIntraOperative[index].management ??
                              '-',
                          subRightContent:
                              _controller.listIntraOperative[index].gender ??
                                  '-',
                        ),
                      );
                    }),
                onRefresh: () => _controller.getIntraOperativesData(),
              );
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
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _navigateToAddIntraOperativePage(),
      ),
    );
  }

  void _navigateToAddIntraOperativePage() =>
      Get.toNamed(Constants.reRoute.addIntraOperative);

  void _navigateToDetailPage(IntraOperative intraOperative) => Get.dialog(
        DetailIntraOperativePage(intraOperative: intraOperative),
      );
}

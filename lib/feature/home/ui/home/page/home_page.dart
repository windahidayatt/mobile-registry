import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/home/enum/home_page_type.dart';
import 'package:mobile_registry/feature/home/ui/home/controller/home_controller.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _controller = sl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Registry'),
        centerTitle: true,
      ),
      body: Obx(
        () => _controller.pages[_controller.indexPage.value],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const ListTile(
              title: Text('Shoulder And Elbow Registry'),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () => _changePage(HomePageType.dashboard),
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: const Text('Management & Report'),
              children: [
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text('Patient Data'),
                  onTap: () => _changePage(HomePageType.patientData),
                ),
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text('Patient Report'),
                  onTap: () => _changePage(HomePageType.report),
                )
              ],
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: const Text('Operative'),
              children: [
                ListTile(
                  leading: const Icon(Icons.file_copy),
                  title: const Text('Pre Operative'),
                  onTap: () => _changePage(HomePageType.preOperative),
                ),
                ListTile(
                  leading: const Icon(Icons.file_copy),
                  title: const Text('Intra Operative'),
                  onTap: () => _changePage(HomePageType.intraOperative),
                ),
                ListTile(
                  leading: const Icon(Icons.file_copy),
                  title: const Text('Post Operative'),
                  onTap: () => _changePage(HomePageType.postOperative),
                ),
              ],
            ),
            const Spacer(),
            _versionApp(),
          ],
        ),
      ),
    );
  }

  Widget _versionApp() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Text(
        "Registry Version 1.0",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.inter,
          color: ColorTone.reLightBlack,
          fontSize: 10.sp,
        ),
      ),
    );
  }

  void _changePage(HomePageType homePageType) {
    _controller.indexPage(homePageType.value);
    Get.back();
  }
}

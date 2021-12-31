import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/home/enum/home_page_type.dart';
import 'package:mobile_registry/feature/home/ui/home/controller/home_controller.dart';
import 'package:mobile_registry/gen/assets.gen.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/se_error.dart';
import 'package:mobile_registry/shared_library/state/se_loading.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = sl();

  @override
  void initState() {
    super.initState();
    ever(_controller.viewState, (ViewState value) {
      if (value.status == Status.LOADING) {
        Get.dialog(const SELoading());
      }

      if (value.status == Status.ERROR) {
        SEError.show(error: value.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(_controller.indexPage.value.title),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => _controller.pages[_controller.indexPage.value.getIndex],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _appInfo(),
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
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () => _controller.logout(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appInfo() {
    return ListTile(
      title: Row(
        children: [
          Container(
            width: 16.w,
            height: 16.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Assets.image.icon.logo, fit: BoxFit.cover)),
          ),
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shoulder\nElbow Registry',
                style: TextStyle(
                  fontFamily: FontFamily.inter,
                  fontWeight: FontWeight.w800,
                  color: ColorTone.reLightBlack,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                "Registry Version 1.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.inter,
                  color: ColorTone.reLightBlack,
                  fontSize: 8.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _changePage(HomePageType homePageType) {
    _controller.indexPage(homePageType);
    Get.back();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/home/enum/home_page_type.dart';
import 'package:mobile_registry/feature/home/ui/dashboard/ui/dashboard_page.dart';
import 'package:mobile_registry/feature/management_report/ui/patient_data/page/patient_data_page.dart';
import 'package:mobile_registry/feature/management_report/ui/report/page/report_page.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/page/intra_operative_page.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/page/post_operative_page.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/page/pre_operative_page.dart';

class HomeController extends GetxController {
  RxInt indexPage = HomePageType.dashboard.value.obs;
  RxList<Widget> pages = const [
    DashboardPage(),
    PatientDataPage(),
    ReportPage(),
    PreOperativePage(),
    IntraOperativePage(),
    PostOperativePage(),
  ].obs;
}

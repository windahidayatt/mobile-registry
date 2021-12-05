import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/logout_usecase.dart';
import 'package:mobile_registry/feature/home/enum/home_page_type.dart';
import 'package:mobile_registry/feature/home/ui/dashboard/ui/dashboard_page.dart';
import 'package:mobile_registry/feature/management_report/ui/patient_data/page/patient_data_page.dart';
import 'package:mobile_registry/feature/management_report/ui/report/page/report_page.dart';
import 'package:mobile_registry/feature/operative/ui/intra_operative/page/intra_operative_page.dart';
import 'package:mobile_registry/feature/operative/ui/post_operative/page/post_operative_page.dart';
import 'package:mobile_registry/feature/operative/ui/pre_operative/page/pre_operative_page.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/use_case/use_case.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

class HomeController extends GetxController {
  final LogoutUseCase logoutUseCase;
  HomeController({required this.logoutUseCase});

  RxInt indexPage = HomePageType.dashboard.value.obs;
  final Rx<ViewState> viewState = ViewState.initial().obs;
  RxList<Widget> pages = const [
    DashboardPage(),
    PatientDataPage(),
    ReportPage(),
    PreOperativePage(),
    IntraOperativePage(),
    PostOperativePage(),
  ].obs;


  void logout(){
    _logout();
  }

  void _logout() async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await logoutUseCase.call(NoParams());
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      _navigateToSplashPage();
    });
  }

  void _navigateToSplashPage(){
    Get.offAndToNamed(Constants.reRoute.initial);
  }
}

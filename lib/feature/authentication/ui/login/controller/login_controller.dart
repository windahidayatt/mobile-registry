import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/login_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';

class LoginController extends GetxController {
  final Rx<ViewState> viewState = ViewState.initial().obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});

  void login(){
    _requestLogin();
  }
  void _requestLogin() async {
    viewState(ViewState.loading());
    Either<Failure, bool> result = await loginUseCase.call(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold((l) {
      viewState(ViewState.error(l.message.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
      _navigateToHomePage();
    });
  }

  _navigateToHomePage(){
    Get.offAndToNamed(Constants.reRoute.home);
  }
}

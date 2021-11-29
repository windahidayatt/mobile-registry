import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/domain/authentication/domain/entities/result_login.dart';
import 'package:mobile_registry/domain/authentication/domain/usecases/login_usecase.dart';
import 'package:mobile_registry/shared_library/failure/failure.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';

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
    Either<Failure, ResultLogin> result = await loginUseCase.call(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold((l) {
      viewState(ViewState.error(l.toString()));
    }, (r) {
      viewState(ViewState.completed(r));
    });
  }
}

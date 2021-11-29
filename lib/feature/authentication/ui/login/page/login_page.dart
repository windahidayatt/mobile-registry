import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/authentication/ui/login/controller/login_controller.dart';
import 'package:mobile_registry/gen/assets.gen.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/components/form/re_text_field.dart';
import 'package:mobile_registry/shared_library/components/form/re_validator.dart';
import 'package:mobile_registry/shared_library/lifecycle/view_state.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/state/se_error.dart';
import 'package:mobile_registry/shared_library/state/se_loading.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = sl();

  @override
  void initState() {
    super.initState();
    ever(_controller.viewState, (ViewState value){
      if(value.status == Status.LOADING){
        Get.dialog(const SELoading());
      }

      if(value.status == Status.ERROR){
        SEError.show(error: value.message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTone.reWhite,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Center(
          child: SingleChildScrollView(
            child: Obx((){
              switch(_controller.viewState.value.status){
                case Status.INITIAL:
                case Status.LOADING:
                case Status.COMPLETED:
                case Status.ERROR:
                  return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Assets.image.main.splashMainImage,
                          )),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Silahkan Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontFamily.inter,
                        fontWeight: FontWeight.w800,
                        color: ColorTone.reLightBlack,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "Gunakan akun yang terdaftar oleh sistem.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontFamily.inter,
                        color: ColorTone.reLightBlack,
                        fontSize: 10.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                      child: RETextField(
                        controller: _controller.emailController,
                        label: "Email",
                        validator: REValidator.validatorEmail,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: ColorTone.reDarkGrey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: RETextField(
                        controller: _controller.passwordController,
                        label: 'Password',
                        isPassword: true,
                        validator: REValidator.validatorPassword,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: ColorTone.reDarkGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: REButton(
                              label: 'Masuk',
                              onTap: () => _controller.login(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_registry/feature/authentication/ui/splash/controller/splash_controller.dart';
import 'package:mobile_registry/gen/assets.gen.dart';
import 'package:mobile_registry/gen/fonts.gen.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = sl();

  @override
  void initState() {
    _controller.checkSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              height: 20.h,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.image.main.inases,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.image.main.unpad,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: Assets.image.main.orthopaedi,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Shoulder and Elbow\nRegistry",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.inter,
                fontWeight: FontWeight.w800,
                color: ColorTone.reLightBlack,
                fontSize: 14.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 22.w),
              child: const LinearProgressIndicator(),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              "Registry Version 1.0",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.inter,
                color: ColorTone.reLightBlack,
                fontSize: 10.sp,
              ),
            ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_registry/feature/authentication/ui/splash/controller/splash_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
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
            const Icon(Icons.local_hospital, size: 128),
            const Text("Registry"),
            const Spacer(
              flex: 1,
            ),
            const Text("Registry Version 1.0"),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
    );
  }
}

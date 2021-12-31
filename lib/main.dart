import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/feature/home/route/home_route.dart';
import 'package:mobile_registry/feature/operative/route/operative_route.dart';
import 'package:sizer/sizer.dart';
import 'package:mobile_registry/feature/authentication/route/authentication_route.dart';
import 'package:mobile_registry/feature/authentication/ui/splash/page/splash_page.dart';
import 'package:mobile_registry/shared_library/injection/injection.dart';
import 'package:mobile_registry/shared_library/set_orientation/set_orientation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection().initialize();
  SetOrientation().setPortrait();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return GetMaterialApp(
          title: 'Flutter Demo',
          home: const SplashPage(),
          getPages: [
            ...authenticationRoute(),
            ...homeRoute(),
            ...operativeRoute(),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_registry/feature/authentication/ui/splash/controller/splash_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = sl();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.local_hospital, size: 48),
      ),
    );
  }
}

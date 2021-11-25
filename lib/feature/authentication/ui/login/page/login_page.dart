import 'package:flutter/material.dart';
import 'package:mobile_registry/feature/authentication/ui/login/controller/login_controller.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = sl();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Login Page"),
      ),
    );
  }
}

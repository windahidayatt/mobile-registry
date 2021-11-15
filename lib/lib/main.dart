import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_registry/lib/ui/menu/page/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: MenuPage(),
    );
  }
}

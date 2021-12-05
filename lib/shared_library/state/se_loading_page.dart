import 'package:flutter/material.dart';

class SELoadingPage extends StatelessWidget {
  const SELoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

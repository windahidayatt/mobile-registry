import 'package:flutter/material.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class SELoading extends StatelessWidget {
  const SELoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Material(
        color: ColorTone.reLightBlack.withOpacity(0.4),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

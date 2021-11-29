import 'package:flutter/material.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class REButton extends StatelessWidget {
  const REButton({
    Key? key,
    this.onTap,
    required this.label,
  }) : super(key: key);
  final Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label.toUpperCase(),
      ),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(ColorTone.reWhite),
        backgroundColor: MaterialStateProperty.all<Color>(ColorTone.reOrange),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
        ),
      ),
      onPressed: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_registry/shared_library/components/button/re_button.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class REFileField extends StatelessWidget {
  const REFileField({
    Key? key,
    required this.label,
    required this.fileName,
    this.onTap,
  }) : super(key: key);
  final String label;
  final String fileName;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorTone.reDarkGrey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              Text(fileName),
            ],
          ),
          REButton(
            label: 'Choose File',
            onTap: onTap,
          )
        ],
      ),
    );
  }
}

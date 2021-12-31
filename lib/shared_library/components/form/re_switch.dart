import 'package:flutter/cupertino.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class RESwitch extends StatelessWidget {
  const RESwitch({
    Key? key,
    required this.value,
    required this.label,
    this.onChanged,
  }) : super(key: key);
  final bool value;
  final String label;
  final void Function(bool)? onChanged;

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
          Text(label),
          CupertinoSwitch(
            activeColor: ColorTone.reOrange,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

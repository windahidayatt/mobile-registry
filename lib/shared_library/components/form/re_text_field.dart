import 'package:flutter/material.dart';
import 'package:mobile_registry/shared_library/utils/color_tone.dart';

class RETextField extends StatelessWidget {
  const RETextField({
    Key? key,
    required this.controller,
    this.label,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
    this.helperText,
  }) : super(key: key);
  final String? label;
  final bool isPassword;
  final Icon? prefixIcon;
  final String? helperText;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        helperText: helperText,
        labelText: label,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: ColorTone.reDarkGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: ColorTone.reDarkGrey),
        ),
      ),
    );
  }
}

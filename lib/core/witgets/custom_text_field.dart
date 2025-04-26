import 'package:flutter/material.dart';
import '../app_config/app_colors.dart';
import '../app_config/font_styles.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool isObscure;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final int maxLines;
  final TextInputAction? textInputAction;
  final bool enabled;

  const MyTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.isObscure,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.textInputAction,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscure,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      textInputAction: textInputAction,
      enabled: enabled,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: FontStyles.body14W500.copyWith(
          color: AppColors.secoundrycolor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        ),
      ),
    );
  }
}

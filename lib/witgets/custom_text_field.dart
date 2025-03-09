import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? sufixicon;
  final double? width;
  final double? hight;
  final IconData? iconfeild;
  final Color? feildcolor;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.hintText,
    this.sufixicon,
    this.width,
    this.hight,
    this.iconfeild,
    this.feildcolor,
    this.controller,
    this.validator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 358.w,
      height: hight ?? 90.h,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          //=======================
          controller: controller,
          validator: validator,
          //==========================
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),

            fillColor: feildcolor ?? Color(0xffFFD2B1),
            filled: true,
            suffixIcon: sufixicon,
          ),
        ),
      ),
    );
  }
}

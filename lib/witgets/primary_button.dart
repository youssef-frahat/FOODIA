import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/styling/app_colors.dart';
import 'package:foodia_app/styling/app_fonts.dart';

class Primarybutton extends StatelessWidget {
  final String? buttontext;
  final Color? buttoncolor;
  final double? width;
  final double? hight;
  final double? borderrediuse;
  final Color? textcolor;
  final double? fontsize;
  final void Function()? onpress;
  final FontWeight? fontWeight;

  const Primarybutton({
    super.key,
    this.buttontext,
    this.buttoncolor,
    this.width,
    this.hight,
    this.borderrediuse,
    this.textcolor,
    this.onpress,
    this.fontsize,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor ?? AppColors.primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderrediuse ?? 50.r),
        ),
        fixedSize: Size(width ?? 240.w, hight ?? 48.h),
      ),
      child: Text(
        buttontext ?? "",
        style: TextStyle(
          color: textcolor ?? Colors.white,
          fontFamily: AppFonts.mainfontsname,
          fontWeight: fontWeight ,
          fontSize: fontsize ?? 16.sp,
        ),
      ),
    );
  }
}

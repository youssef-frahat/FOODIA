import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/styling/app_colors.dart';
import 'package:foodia_app/core/styling/app_fonts.dart';

class AppStyling {
  static TextStyle primarytextstyle = TextStyle(
    fontFamily: AppFonts.mainfontsname,
    fontWeight: FontWeight.bold,
    fontSize: 32.sp,
    color: AppColors.primarycolor,
  );

  static TextStyle secoundrytextstyle = TextStyle(
    fontFamily: AppFonts.mainfontsname,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: AppColors.secoundrycolor,
  );

}

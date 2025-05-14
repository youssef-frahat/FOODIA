import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/material_dialogs.dart';

class AppMessages {
  static Future<dynamic> showLoading(BuildContext context) =>
      showDialog<dynamic>(
        context: context,
        barrierDismissible: false,
        builder:
            (_) => const PopScope(
              canPop: false,
              child: Center(child: CircularProgressIndicator.adaptive()),
            ),
      );

  static void showError(BuildContext context, String error) {
    Dialogs.materialDialog(
      context: context,
      color: Colors.white,
      title: 'حدث خطأ ❗',
      titleStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Changa',
        color: Colors.red,
      ),
      msg: error,
      msgStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Changa',
        color: Colors.black,
      ),
      lottieBuilder: Lottie.asset(
        'assets/animation/error.json',
        fit: BoxFit.contain,
        width: 120.w,
        height: 120.h,
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    Dialogs.materialDialog(
      context: context,
      color: Colors.white,
      title: 'تم بنجاح 🎉',
      titleStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Changa',
        color: Colors.green,
      ),
      msg: message,
      msgStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Changa',
        color: Colors.black,
      ),
      lottieBuilder: Lottie.asset(
        'assets/animation/success.json',
        fit: BoxFit.contain,
        width: 120.w,
        height: 120.h,
      ),
    );
  }
}

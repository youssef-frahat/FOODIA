import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/styling/app_colors.dart';

class WigetBack extends StatelessWidget {
  final void Function()? onpress;
  const WigetBack({super.key, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: AppColors.primarycolor,
          border: Border.all(color: AppColors.primarycolor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: IconButton(
            onPressed: onpress,
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

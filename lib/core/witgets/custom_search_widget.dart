import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_config/app_assets.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.search, size: 24.sp, color: Colors.black),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            AppAssets.filtrtSvg,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.contain,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

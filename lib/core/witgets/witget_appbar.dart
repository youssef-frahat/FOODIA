import 'package:flutter/material.dart';

import '../app_config/app_colors.dart';

class WitgetAppbar extends StatelessWidget {
  final void Function()? onpress;
  final double? iconsize;
  final Color? background;
  final Color? iconcolor;
  const WitgetAppbar({
    super.key,
    this.iconsize,
    this.background,
    this.iconcolor,
    this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundcolor,
      elevation: 0,
      leading: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.all(15),
          backgroundColor: background ?? AppColors.primarycolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          fixedSize: Size(20, 15),
        ),
        onPressed: onpress,
        child: Center(
          child: Icon(
            Icons.arrow_back,
            size: iconsize ?? 25,
            color: iconcolor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}

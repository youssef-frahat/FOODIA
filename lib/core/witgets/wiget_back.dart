import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodia_app/core/app_config/app_icons.dart';

class CustomWigetArrowBack extends StatelessWidget {
  final void Function()? onpress;
  const CustomWigetArrowBack({super.key, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: onpress, icon: SvgPicture.asset(AppIcons.arrow)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/extensions/spacing.dart';

class ButtonAddBalance extends StatelessWidget {
  const ButtonAddBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange, 
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أضف رصيد لمحفظتك',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontFamily: 'Changa',
              ),
            ),
            horizontalSpace(10),
            SvgPicture.asset('assets/icons/add_wallet.svg'),
          ],
        ),
      ),
    );
  }
}


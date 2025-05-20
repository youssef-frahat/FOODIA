import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodia_app/core/extensions/spacing.dart';

class CartBottomBar extends StatelessWidget {
  final int totalPrice;
  final VoidCallback onOrderPressed;

  const CartBottomBar({
    super.key,
    required this.totalPrice,
    required this.onOrderPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF99F1B), Color(0xFFF47920)],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(60.r)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFF47726),
            blurRadius: 40,
            spreadRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      padding: REdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: onOrderPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60.r),
              ),
              padding: REdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              elevation: 0,
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/chevron-right.svg'),
                horizontalSpace(12),
                Text(
                  'اطلب',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الاجمالي',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
              verticalSpace(15),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'جنية ',
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: '$totalPrice',
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styling/font_styles.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xFFF8A435), width: 2.5.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.asset(
              "assets/images/pepperoni_pizza.png",
              width: 128.w,
              height: 128.h,
              fit: BoxFit.cover,
            ),
          ),

          // SizedBox(width: 16.w),

          Expanded(
            child: Column(
         
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'بيتزا سجق',
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "(نصف تسوية)",
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 13.sp,
                    color: const Color(0xFFFE8C00),
                  ),
                ),

                SizedBox(height: 8.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.star, size: 18.sp, color: Colors.orange),
                    SizedBox(width: 4.w),
                    Text(
                      "20 تقييم",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage("assets/images/chef.png"),
              ),
              SizedBox(height: 8.h),
              Text(
                "الشيف: أحمد",
                style: FontStyles.body14W500.copyWith(
                  fontSize: 14.sp,
                  color: const Color(0xFF20402A),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(6.w),
                child: Icon(Icons.add, color: Colors.white, size: 20.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

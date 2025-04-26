import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_config/font_styles.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xFFF8A435), width: 1.8.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CircleAvatar(
                    radius: 22.r,
                    backgroundImage: NetworkImage(
                      "https://imgs.search.brave.com/-5pN5wyhnDIqh4z1UAVEL7ok8v6g7GAy5Qql7KgWT1A/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzLzVmLzlj/LzkxLzVmOWM5MWZj/MmRmM2VkYjM5NGRl/NWFhMmRkNTFlNDA4/LmpwZw",
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "الشيف غادة",
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 12.sp,
                    color: const Color(0xFF20402A),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          Image.asset(
            "assets/images/pepperoni_pizza.png",
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'بيتزا سجق',
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  "100ج.م",
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xFFFE8C00),
                  ),
                ),

                Text(
                  "120ج.م",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12.sp,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "4.5",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.star, size: 18.sp, color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

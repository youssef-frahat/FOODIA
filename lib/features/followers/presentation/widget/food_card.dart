import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_config/font_styles.dart';
import '../../../../core/extensions/spacing.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final String foodType;
  final String price;
  final String? offerPrice;
  final String description;
  final String imageUrl;

  const FoodCard({
    super.key,
    required this.name,
    required this.foodType,
    required this.price,
    this.offerPrice,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: const Color(0xFFF8A435), width: 1.8.w),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110.h,
            width: 110.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: const Color(0xffFE8C00),
                    fontFamily: 'Changa',
                  ),
                ),
                verticalSpace(4),
                Text(
                  '($foodType)',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontFamily: 'Changa',
                  ),
                ),
                verticalSpace(6),
                Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Colors.grey[600],
                    fontFamily: 'Changa',
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // السعر والعرض
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$price د.ج',
                style: FontStyles.body14W500.copyWith(fontSize: 20.sp),
              ),
              verticalSpace(5),
              if (offerPrice != null && offerPrice!.isNotEmpty)
                Text(
                  '$offerPrice د.ج',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 14.sp,
                    color: Colors.grey[400],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

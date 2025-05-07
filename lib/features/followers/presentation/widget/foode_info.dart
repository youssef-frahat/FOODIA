import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_config/image_urls.dart';
import '../../../../core/extensions/spacing.dart';
import '../../data/model/get_all_followers_chefe_model/food.dart';

class FoodInfo extends StatelessWidget {
  final FoodModel food;
  const FoodInfo({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 110.h,
              width: 110.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('${imageUrl}${food.image}',),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            horizontalSpace(10),
            Text(
              food.name!,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: const Color(0xffFE8C00),
                fontFamily: 'Changa',
              ),
            ),
            horizontalSpace(8),
            Text(
              '(${food.foodType})',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Colors.black,
                fontFamily: 'Changa',
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100.w),
          child: Text(
            food.description!,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
              fontSize: 12.sp,
              fontFamily: 'Changa',
            ),
          ),
        ),
      ],
    );
  }
}

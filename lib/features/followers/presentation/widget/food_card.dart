import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_config/font_styles.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../../../core/extensions/spacing.dart';
import '../../data/model/get_foodes_chefe_model/datum.dart';

class FoodCard extends StatelessWidget {
  final FoodesModel foodesModel;
  const FoodCard({super.key, required this.foodesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: REdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: const Color(0xFFF8A435), width: 1.8.w),
        ),
        child: Column(
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
                      image: NetworkImage(
                        '${imageUrl}${foodesModel.image ?? ''}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 150.w),
                      child: Text(
                        foodesModel.name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: const Color(0xffFE8C00),
                          fontFamily: 'Changa',
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    Text(
                      '(${foodesModel.foodType ?? ''})',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontFamily: 'Changa',
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      foodesModel.price ?? '',
                      style: FontStyles.body14W500.copyWith(fontSize: 25.sp),
                    ),
                    verticalSpace(5),
                    Text(
                      foodesModel.offerPrice ?? '',
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 15.sp,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: Text(
                foodesModel.description ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                  fontSize: 12.sp,
                  fontFamily: 'Changa',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

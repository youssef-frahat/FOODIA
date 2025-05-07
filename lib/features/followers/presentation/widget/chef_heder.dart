import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_config/font_styles.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../../../core/extensions/spacing.dart';
import '../../data/model/get_all_followers_chefe_model/chef.dart';

class ChefHeader extends StatelessWidget {
   final Chef? chef;
   final String price;
   final String offerPrice;
  const ChefHeader({super.key,this.chef, required this.price, required this.offerPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage('${imageUrl}${chef?.image}',),
              fit: BoxFit.cover,
            ),
          ),
        ),
        horizontalSpace(10),
        Text(
          chef?.name ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
            fontFamily: 'Changa',
          ),
        ),
        const Spacer(),
        Column(
          children: [
            Text(
              price,
              style: FontStyles.body14W500.copyWith(fontSize: 25.sp),
            ),
            verticalSpace(5),
            Text(
              offerPrice,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 15.sp,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

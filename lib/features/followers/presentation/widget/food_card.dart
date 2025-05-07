import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/spacing.dart';
import '../../data/model/get_all_followers_chefe_model/food.dart';
import 'chef_heder.dart';
import 'foode_info.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;
  const FoodCard({super.key, required this.food});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChefHeader(
            price: food.price!,
            offerPrice: food.offerPrice!,
            
        ), verticalSpace(10), FoodInfo(
          food: food,
        )],
      ),
    );
  }
}

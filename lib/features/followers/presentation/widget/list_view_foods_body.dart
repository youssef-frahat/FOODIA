import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/get_all_followers_chefe_model/food.dart';
import 'food_card.dart';

class ListViewFoodsBody extends StatelessWidget {
  final List<FoodModel> foods;
  const ListViewFoodsBody({super.key, required this.foods});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: REdgeInsets.symmetric(horizontal: 16),
        itemCount: foods.length,
        itemBuilder: (context, index) {
            final food = foods[index];
          return FoodCard(
food: food,
          );
        },
      ),
    );
  }
}

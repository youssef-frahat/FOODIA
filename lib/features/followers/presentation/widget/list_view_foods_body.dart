import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/cubit/all_followers_cubit.dart';
import 'food_card.dart';

class ListViewFoodsBody extends StatelessWidget {
  const ListViewFoodsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFollowersCubit, AllFollowersState>(
      builder: (context, state) {
        if (state is GetFoodesChefeSuccess) {
          final foodes = state.getFoodesChefeModel.data;

          return Expanded(
            child: ListView.builder(
              padding: REdgeInsets.symmetric(horizontal: 16),
              itemCount: foodes!.length,
              itemBuilder: (context, index) {
                return FoodCard(
                  foodesModel: foodes[index],
                );
              },
            ),
          );
        } else if (state is GetFoodesChefeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetFoodesChefeFailure) {
          return Center(child: Text(state.error));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

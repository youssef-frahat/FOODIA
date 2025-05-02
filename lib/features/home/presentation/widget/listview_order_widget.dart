import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/core/app_config/messages.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';

import '../logic/home_foods/cubit/all_foods_cubit.dart';
import 'order_card_widget.dart';

class ListviewOrderWidget extends StatelessWidget {
  const ListviewOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => getIt<AllFoodsCubit>()..getAllHomeFoods(foodName: ''),
      child: BlocBuilder<AllFoodsCubit, AllFoodsState>(
        builder: (context, state) {
          if (state is AllFoodsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AllFoodsError) {
            AppMessages.showError(context, state.error);
          }
          if (state is AllFoodsLoaded) {
            final homeFoods = state.getHomeFoodsModel;
            return Flexible(
              child: ListView.builder(
                itemCount: homeFoods.data?.data?.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final food = homeFoods.data?.data?[index];
                  return OrderWidget(getHomeFoodsModel: food!);
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

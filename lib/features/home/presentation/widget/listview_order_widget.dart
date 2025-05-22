import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/core/app_config/messages.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import 'package:foodia_app/features/cart/presentation/logic/cubit/add_to_cart_cubit.dart';
import '../logic/home_foods/cubit/all_foods_cubit.dart';
import 'order_card_widget.dart';

class ListviewOrderWidget extends StatefulWidget {
  final String searchQuery;

  const ListviewOrderWidget({super.key, required this.searchQuery});

  @override
  State<ListviewOrderWidget> createState() => _ListviewOrderWidgetState();
}

class _ListviewOrderWidgetState extends State<ListviewOrderWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        context.read<AllFoodsCubit>().loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddToCartCubit>(
      create: (_) => getIt<AddToCartCubit>(),
      child: BlocBuilder<AllFoodsCubit, AllFoodsState>(
        builder: (context, state) {
          if (state is AllFoodsLoading && context.read<AllFoodsCubit>().currentPage == 1) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AllFoodsError) {
            AppMessages.showError(context, state.error);
            return const SizedBox();
          }

          if (state is AllFoodsLoaded) {
            final allFoods = state.foods;

            final filteredFoods = allFoods
                .where(
                  (food) => food.name!.toLowerCase().contains(
                        widget.searchQuery.toLowerCase(),
                      ),
                )
                .toList();

            return Expanded(
              child: filteredFoods.isEmpty
                  ? const Center(child: Text('لا توجد نتائج مطابقة'))
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: filteredFoods.length + 1,
                      itemBuilder: (context, index) {
                        if (index == filteredFoods.length) {
                          final isLast = context.read<AllFoodsCubit>().isLastPage;
                          return isLast
                              ? const SizedBox()
                              : const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                        }

                        final food = filteredFoods[index];

                        return BlocListener<AddToCartCubit, AddToCartState>(
                          listener: (context, addState) {
                            if (addState is AddToCartSuccess) {
                              AppMessages.showSuccess(
                                context,
                                "تمت الإضافة إلى السلة",
                              );
                            } else if (addState is AddToCartError) {
                              AppMessages.showError(context, addState.error);
                            }
                          },
                          child: OrderWidget(getHomeFoodsModel: food),
                        );
                      },
                    ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

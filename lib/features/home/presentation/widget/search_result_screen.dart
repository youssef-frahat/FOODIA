import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodia_app/core/app_config/messages.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import 'package:foodia_app/features/cart/presentation/logic/cubit/add_to_cart_cubit.dart';
import 'package:foodia_app/features/home/presentation/logic/home_foods/cubit/all_foods_cubit.dart';
import 'package:foodia_app/features/home/presentation/widget/order_card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  void initState() {
    super.initState();
    context.read<AllFoodsCubit>().getAllFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Container(
  height: 45,
  decoration: BoxDecoration(
    color: const Color(0xFFF8F8F8),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: TextField(
    autofocus: true,
    onChanged: (val) {
      setState(() {
        query = val;
      });
    },
    style: const TextStyle(fontSize: 16),
    decoration: InputDecoration(
      hintText: 'ابحث عن وجبة...',
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: const Icon(Icons.search, color: Colors.orange, size: 26),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    ),
  ),
),

      ),
      body: BlocProvider(
        create: (_) => getIt<AddToCartCubit>(),
        child: BlocBuilder<AllFoodsCubit, AllFoodsState>(
          builder: (context, state) {
            if (state is AllFoodsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AllFoodsError) {
              return Center(child: Text(state.error));
            }

            if (state is AllFoodsLoaded) {
              final allFoods = state.foods;

              final filteredFoods =
                  allFoods
                      .where(
                        (food) => food.name!.toLowerCase().contains(
                          query.toLowerCase(),
                        ),
                      )
                      .toList();

              if (query.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/search.png',
                    fit: BoxFit.fill,
                    height: 300,
                    width: 300,
                  ),
                );
              }

              if (filteredFoods.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.search_off,
                      size: 80,
                      color: Colors.orange,
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: const Text(
                        'لم يتم العثور على نتائج',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ),
                  ],
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: filteredFoods.length,
                itemBuilder: (context, index) {
                  final food = filteredFoods[index];

                  return BlocListener<AddToCartCubit, AddToCartState>(
                    listener: (context, addState) {
                      if (addState is AddToCartSuccess) {
                        AppMessages.showSuccess(
                          context,
                          'تمت الإضافة إلى السلة',
                        );
                      } else if (addState is AddToCartError) {
                        AppMessages.showError(context, addState.error);
                      }
                    },
                    child: OrderWidget(getHomeFoodsModel: food),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

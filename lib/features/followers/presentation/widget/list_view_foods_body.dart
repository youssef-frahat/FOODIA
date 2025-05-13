// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:foodia_app/core/app_config/image_urls.dart';
// import '../logic/cubit/all_followers_cubit.dart';
// import 'food_card.dart';

// class ListViewFoodsBody extends StatelessWidget {
//   const ListViewFoodsBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AllFollowersCubit, AllFollowersState>(
//       builder: (context, state) {
//         if (state is AllFollowersCombinedState && state.foods != null) {
//           final foods = state.foods!.data;

//           if (foods == null || foods.isEmpty) {
//             return const Center(child: Text('لا توجد أطعمة لعرضها.'));
//           }

//           return ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             itemCount: foods.length,
//             itemBuilder: (context, index) {
//               final food = foods[index];
//               return FoodCard(
//                 name: food.name ?? '',
//                 description: food.description ?? '',
//                 foodType: food.foodType ?? '',
//                 imageUrl: '$imageUrl${food.image}'
// ,
//                 price: food.price.toString(),
//                 offerPrice: food.offerPrice.toString(),
//               );
//             },
//           );
//         } else if (state is AllFollowersLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is AllFollowersFailure) {
//           return Center(child: Text(state.error));
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }

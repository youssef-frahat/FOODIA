import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/special_offer_section.dart';

import '../logic/home_foods/cubit/all_foods_cubit.dart';
import 'categories_list.dart';
import 'listview_order_widget.dart';
import 'search_result_screen.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          GestureDetector(
           onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => getIt<AllFoodsCubit>()..getAllFoods(),
        child: const SearchScreen(),
      ),
    ),
  );
},

            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث عن الأكل...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F8F8),
                ),
              ),
            ),
          ),

          verticalSpace(20.h),
          SpecialOfferSlider(),
          verticalSpace(20.h),
          CategoriesList(),
          verticalSpace(20.h),

          ListviewOrderWidget(searchQuery: searchQuery),
        ],
      ),
    );
  }
}

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
                  builder:
                      (_) => BlocProvider(
                        create: (_) => getIt<AllFoodsCubit>()..getAllFoods(),
                        child: const SearchScreen(),
                      ),
                ),
              );
            },

           child: AbsorbPointer(
  child: Container(
    height: 45.h,
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
      decoration: InputDecoration(
        hintText: 'ابحث عن الأكل...',
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
        prefixIcon: const Icon(Icons.search, color: Colors.orange),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      ),
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

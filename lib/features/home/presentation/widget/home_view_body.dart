import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/custom_search_widget.dart';
import '../../../../core/witgets/special_offer_section.dart';
import '../logic/home_foods/cubit/all_foods_cubit.dart';
import 'categories_list.dart';
import 'listview_order_widget.dart';

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
          TextField(
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
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

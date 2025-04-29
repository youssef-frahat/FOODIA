import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/witgets/custom_search_widget.dart';
import '../../../../core/witgets/special_offer_section.dart';
import 'categories_list.dart';
import 'listview_order_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          CustomSearchWidget(),
          SizedBox(height: 20.h),
          SpecialOfferCard(),
          SizedBox(height: 20),
          CategoriesList(),
          SizedBox(height: 15.h),
          ListviewOrderWidget(),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/custom_search_widget.dart';
import '../../../../core/witgets/special_offer_section.dart';
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
          verticalSpace(20.h),
          SpecialOfferCard(),
          verticalSpace(20.h),
          //   CategoriesList(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "عرض الكل",
                      style: TextStyle(
                        color: const Color(0xFFB54427),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Changa',
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "الأصناف",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Changa',
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 120.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(width: 16.w),
                  itemBuilder: (context, index) {
                    final String imageUrl =
                        "https://mangamediaa.com/house-food/public/";
                    final item = ""; // Replace with your actual data model
                    return Column(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: "",
                            width: 90.w,
                            height: 90.h,
                            placeholder:
                                (context, url) => Container(
                                  width: 80.w,
                                  height: 80.h,
                                  alignment: Alignment.center,
                                  child: const CircularProgressIndicator(),
                                ),
                            errorWidget:
                                (context, url, error) => Container(
                                  width: 80.w,
                                  height: 80.h,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.broken_image),
                                ),
                          ),
                        ),

                        SizedBox(height: 8.h),
                        Text(
                          'اسم غير متوفر',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Changa',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          verticalSpace(20.h),
          ListviewOrderWidget(),
        ],
      ),
    );
  }
}

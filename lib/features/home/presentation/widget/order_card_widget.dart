import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_config/font_styles.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../data/model/get_home_foods_model/datum.dart';

class OrderWidget extends StatelessWidget {
  final FoodsModel getHomeFoodsModel;
  const OrderWidget({super.key, required this.getHomeFoodsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xFFF8A435), width: 1.8.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CircleAvatar(
                    radius: 22.r,
                    backgroundImage: NetworkImage(
                      "$imageUrl${getHomeFoodsModel.chef?.image ?? ''}",
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  getHomeFoodsModel.chef?.name ?? "",
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 12.sp,
                    color: const Color(0xFF20402A),
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                ),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          CachedNetworkImage(
            imageUrl: "$imageUrl${getHomeFoodsModel.image ?? ''}",
            width: 100.w,
            height: 100.h,
            fit: BoxFit.cover,
            placeholder:
                (context, url) => Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
            errorWidget:
                (context, url, error) => Container(
                  width: 100.w,
                  height: 100.h,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image),
                ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  getHomeFoodsModel.name ?? "",
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 12.h),
                Text(
                  "${getHomeFoodsModel.priceAfter} ج.م",
                  style: FontStyles.body14W500.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xFFFE8C00),
                  ),
                  textAlign: TextAlign.end,
                ),

                Text(
                  "${getHomeFoodsModel.priceBefore} ج.م",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 12.sp,
                    color: Colors.grey[400],
                  ),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      getHomeFoodsModel.rate ?? "",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.star, size: 18.sp, color: Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

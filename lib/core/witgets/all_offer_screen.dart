import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/data/model/special_offer_model/datum.dart';
import '../app_config/image_urls.dart';

class AllOffersScreen extends StatelessWidget {
  final List<OfferModel> offers;

  const AllOffersScreen({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("كل العروض"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: ListView.separated(
          itemCount: offers.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final offer = offers[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "$imageUrl${offer.image}",
                      width: 110.w,
                      height: 110.h,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: Colors.red),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            children: [
                              Text(
                                "ج.م ${offer.offerPrice}",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                "ج.م ${offer.price}",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              "خصم خاص",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color(0xFFF8F8F8),
    );
  }
}

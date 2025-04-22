import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_assets.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      padding: REdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        // gradient: const LinearGradient(
        //   colors: [Color(0xFFFFC107), Color(0xFFFF9800)],
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        image:  DecorationImage(
          image: AssetImage(AppAssets.ads),
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
        ),
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       "عرض خاص",
      //       style: TextStyle(
      //         fontSize: 18.sp,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white,
      //       ),
      //     ),
      //     const Spacer(),
      //     Row(
      //       children: [
      //         Text(
      //           "ج.م 190",
      //           style: TextStyle(
      //             fontSize: 14.sp,
      //             color: Colors.white70,
      //             decoration: TextDecoration.lineThrough,
      //           ),
      //         ),
      //         SizedBox(width: 8.w),
      //         Text(
      //           "ج.م 150",
      //           style: TextStyle(
      //             fontSize: 16.sp,
      //             color: Colors.white,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         const Spacer(),
      //         ElevatedButton(
      //           onPressed: () {},
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.black,
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(20.r),
      //             ),
      //           ),
      //           child: Text("اطلب الآن"),
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}

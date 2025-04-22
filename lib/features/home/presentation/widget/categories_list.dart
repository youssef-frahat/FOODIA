import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  final List<Map<String, String>> categories = const [
    {"name": "البيتزا", "image": "assets/images/pazza.png"},
    {"name": "الحلويات", "image": "assets/images/pancake.png"},
    {"name": "السندوتشات", "image": "assets/images/sandwich.png"},
    {"name": "المجمدات", "image": "assets/images/icecream.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "عرض الكل",
              style: TextStyle(
                color: Color(0xFFB54427), 
                fontWeight: FontWeight.bold,
                fontFamily: 'Changa',
                fontSize: 14.sp,
              ),
            ),
            Text(
              "الاصناف",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Changa',
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: REdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final item = categories[index];
              return Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      item["image"]!,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    item["name"]!,
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
    );
  }
}

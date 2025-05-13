import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItemCard extends StatelessWidget {
  final String name;
  final String description;
  final String imageUrl;
  final int quantity;
  final double price;

  const OrderItemCard({
    super.key,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final double total = quantity * price;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 1.5.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              imageUrl,
              width: 90.w,
              height: 90.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Changa',
                  ),
                ),
                SizedBox(height: 4.h),

                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black87,
                    fontFamily: 'Changa',
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 12.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'الكمية: ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Changa',
                          ),
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Changa',
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          'السعر: ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: 'Changa',
                          ),
                        ),
                        Text(
                          'ج.م $price',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Changa',
                          ),
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'الإجمالي',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Changa',
                          ),
                        ),
                        Text(
                          'ج.م $total',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Changa',
                          ),
                        ),
                      ],
                    ),
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

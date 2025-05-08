import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/image_urls.dart';
import 'package:foodia_app/core/witgets/primary_button.dart';
import '../../../../core/extensions/spacing.dart';

class OrderItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String status;
  final String price;
  final int quantity;
  final VoidCallback deletOrder;

  const OrderItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.status,
    required this.price,
    required this.quantity, required this.deletOrder,
  });

  Map<String, Map<String, dynamic>> get statusMapping => {
    'pending': {'text': 'قيد الانتظار', 'color': Colors.orange},
    'cancelled': {'text': 'ملغي', 'color': Colors.red},
    'prepared': {'text': 'تم التجهيز', 'color': Colors.green},
    'preparing': {'text': 'قيد التحضير', 'color': const Color(0xFF0E83F9)},
  };

  @override
  Widget build(BuildContext context) {
    final mapped =
        statusMapping[status] ?? {'text': status, 'color': Colors.black};

    final statusText = mapped['text'] as String;
    final statusColor = mapped['color'] as Color;

    return Container(
      width: double.infinity,
      margin: REdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 120.h,
              width: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 4),
                image: DecorationImage(
                  image: NetworkImage('$imageUrl$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            horizontalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.only(left: 4),
                            decoration: BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            statusText,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  verticalSpace(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'السعر الاجمالي',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      horizontalSpace(10),
                      Text(
                        '$price د.ج',
                        style: TextStyle(fontSize: 14.sp, color: Colors.black),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Text(
                    'الكمية: $quantity',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  if (status == 'pending') ...[
                    verticalSpace(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Primarybutton(
                        borderrediuse: 30.r,
                        buttoncolor: Colors.orange,
                        buttontext: 'الغاء الطلب',
                        fontsize: 12.sp,
                        width: 120.w,
                        onpress: deletOrder,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

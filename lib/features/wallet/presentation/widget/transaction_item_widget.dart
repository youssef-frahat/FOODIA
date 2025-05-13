import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/spacing.dart';

class TransactionItemWidget extends StatelessWidget {
  final String date;
  final String transactionType;
  final String amount;

  const TransactionItemWidget({
    super.key,
    required this.date,
    required this.transactionType,
    required this.amount,
  });

  String _mapTransactionType(String type) {
    final t = type.trim();
    switch (t) {
      case 'messages.payOrder':
      case 'payOrder':
        return 'دفع طلب';

      case 'messages.cancelOrder':
      case 'cancelOrder':
        return 'إلغاء طلب';

      case 'messages.rejectOrder':
      case 'rejectOrder':
        return 'رفض طلب';

      case 'messages.addBalance':
      case 'addBalance':
      case 'اضافة رصيد':
        return 'إضافة رصيد';

      default:
        return t;
    }
  }

  Color _getTransactionColor(String type) {
    final normalized = _mapTransactionType(type);

    if (normalized.contains('إضافة')) {
      return Colors.green;
    } else if (normalized.contains('إلغاء')) {
      return Colors.red;
    } else if (normalized.contains('رفض')) {
      return Colors.orange.shade700;
    } else if (normalized.contains('دفع')) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String translatedType = _mapTransactionType(transactionType);
    final Color typeColor = _getTransactionColor(transactionType);

    return Container(
      width: double.infinity,
      height: 110.h,
      margin: REdgeInsets.symmetric(vertical: 8),
      padding: REdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'نوع المعاملة: ',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                translatedType,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: typeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Container(
                padding: REdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                      size: 16.sp,
                    ),
                    horizontalSpace(8),
                    Text(
                      date,
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('المبلغ:', style: TextStyle(fontSize: 14.sp)),
              horizontalSpace(12),
              Text(
                '$amount جنيه',
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showRatingSheet(BuildContext context) {
  int _currentRating = 0;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: EdgeInsets.all(20.0.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'ما مدى تقييمك؟',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < _currentRating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 30.sp,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentRating = index + 1;
                        });
                      },
                    );
                  }),
                ),
                SizedBox(height: 20.h),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'وصف تجربتك (اختياري)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // هنا يمكنك إرسال التقييم _currentRating إلى السيرفر مع وصف التجربة إذا لزم الأمر
                      // مثال: sendRatingToServer(_currentRating);
                    },
                    child: Text(
                      'ارسال',
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

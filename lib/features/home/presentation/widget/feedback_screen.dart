import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../logic/reviews/cubit/reviews_cubit.dart';
import '../logic/home_foods/cubit/all_foods_cubit.dart';

void showRatingSheet(
  BuildContext bottomSheetContext,
  BuildContext outerContext, {
  required int foodId,
}) {
  int _currentRating = 0;
  final TextEditingController _commentController = TextEditingController();

  showModalBottomSheet(
    context: bottomSheetContext,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) => getIt<ReviewsCubit>(),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 20.w,
                right: 20.w,
                top: 20.h,
              ),
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
                    controller: _commentController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'وصف تجربتك (اختياري)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  BlocConsumer<ReviewsCubit, ReviewsState>(
                    listener: (context, state) {
                      if (state is ReviewsSuccess) {
                        Navigator.pop(bottomSheetContext); 
                        ScaffoldMessenger.of(bottomSheetContext).showSnackBar(
                          const SnackBar(content: Text('تم إرسال التقييم بنجاح')),
                        );
                        outerContext.read<AllFoodsCubit>().getAllDetalisById(foodId: foodId);
                      } else if (state is ReviewsFailure) {
                        ScaffoldMessenger.of(bottomSheetContext).showSnackBar(
                          SnackBar(
                            content: Text('خطأ: ${state.error}'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is ReviewsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          onPressed: _currentRating == 0
                              ? null
                              : () {
                                  context.read<ReviewsCubit>().submitReview(
                                        foodId: foodId,
                                        star: _currentRating.toString(),
                                        comment: _commentController.text.trim(),
                                      );
                                },
                          child: Text(
                            'ارسال',
                            style: TextStyle(color: Colors.white, fontSize: 16.sp),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

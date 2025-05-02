import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../../../core/app_config/messages.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/primary_button.dart';
import '../logic/home_foods/cubit/all_foods_cubit.dart';
import '../widget/feedback_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int foodId;
  const ProductDetailsScreen({super.key, required this.foodId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  int price = 300;
  int originalPrice = 350;
  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    // final total = price * quantity;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => getIt<AllFoodsCubit>()..getAllDetalisById(foodId:widget.foodId), 
        child: BlocBuilder<AllFoodsCubit, AllFoodsState>(
          builder: (context, state) {
            if (state is AllDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            }  if (state is AllDetailsError) {
              AppMessages.showError(context, state.error);
            }  if (state is AllDetailsSucss) {
              final details = state.getAllDetalisResponseModel;
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: REdgeInsets.only(bottom: 80),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              "$imageUrl${details.data?.food?.image ?? ''}",
                              height: 350.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),

                            Positioned(
                              top: 40.h,
                              left: 10.w,
                              child: CustomWigetArrowBack(
                                onpress: () =>   context.pop(),
                              ),
                            ),
                          ],
                        ),
                        Transform.translate(
                          offset: Offset(0, -30.h),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(30.r),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10.r,
                                ),
                              ],
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  top: -50.h,
                                  right: 16.w,
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 35.r,
                                        backgroundImage:  NetworkImage(
                                          "$imageUrl${details.data?.food?.chef?.image ?? ''}",
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      Text(
                                        details.data?.food?.chef?.name ??
                                            'اسم الشيف',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      verticalSpace(8.h),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(Icons.add, size: 16.sp),
                                        label: Text(
                                          'متابعة',
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey.shade300,
                                          foregroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                          padding: REdgeInsets.symmetric(
                                            horizontal: 12.w,
                                            vertical: 4.h,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 20.w,
                                  child: Container(
                                    height: 150.h,
                                    width: 75.w,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30.r),
                                        bottomRight: Radius.circular(30.r),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 40.h,
                                  left: 30.w,
                                  child: Container(
                                    margin: REdgeInsets.only(left: 8.w),
                                    padding: REdgeInsets.symmetric(
                                      horizontal: 12.w,
                                      vertical: 10.h,
                                    ),
                                    width: 250.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.r),
                                        bottomLeft: Radius.circular(30.r),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 8.r,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          'السعر الاجمالي',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: 'Changa',
                                          ),
                                        ),
                                        Text(
                                          'ج.م$price',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: const Color(0xFF4A4B4D),
                                          ),
                                        ),
                                        verticalSpace(10.h),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              buildIconBtn(Icons.remove, () {
                                                if (quantity > 1) {
                                                  setState(() => quantity--);
                                                }
                                              }),
                                              horizontalSpace(16.w),
                                              Container(
                                                width: 40.w,
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        12.r,
                                                      ),
                                                  border: Border.all(
                                                    color: const Color(
                                                      0xFFCA9744,
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '$quantity',
                                                    style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: const Color(
                                                        0xFFCA9744,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              horizontalSpace(16.w),
                                              buildIconBtn(Icons.add, () {
                                                setState(() => quantity++);
                                              }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 65.h,
                                  right: 150.w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 8.r,
                                        ),
                                      ],
                                    ),
                                    padding: REdgeInsets.all(8.r),
                                    child: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.orange,
                                      size: 24.sp,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 180.h,
                                  left: 16.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                       'ج.م${details.data?.food?.offerPrice ?? price}' ,
                                        style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      Text(
                                        'ج.م${details.data?.food?.price ?? price}' ,
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      verticalSpace(8.h),
                                      Text(
                                        details.data?.food?.category?.name ??
                                            'اسم القسم',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // بقية التفاصيل
                                Padding(
                                  padding: REdgeInsets.all(16.0.r),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      verticalSpace(150.h),
                                      Text(
                                        details.data?.food?.name ??
                                            'اسم المنتج',
                                        style: TextStyle(
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      verticalSpace(8.h),
                                      Text(
                                        details.data?.food?.foodType ??
                                            'اسم القسم',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      verticalSpace(8.h),
                                      Row(
                                        children: [
                                          Text(
                                            'وقت التحضير:',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          horizontalSpace(8.w),
                                          Text(
                                            '${details.data?.food?.preparationTime} دقيقة',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      verticalSpace(15.h),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RatingBarIndicator(
                                           rating: double.tryParse(details.data?.food?.rating?.toString() ?? '') ?? 0.0,
                                            itemCount: 5,
                                            itemSize: 24.sp,
                                            direction: Axis.horizontal,
                                            itemBuilder:
                                                (context, _) => const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                          ),
                                          verticalSpace(5.h),
                                          Text(
                                            details.data?.food?.rating.toString() ??
                                                '0',
                                            style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      verticalSpace(30.h),
                                      Text(
                                        'الوصف',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      verticalSpace(10.h),
                                      Text(
                                        details.data?.food?.description ??
                                            'لا يوجد وصف متاح.',
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      verticalSpace(50.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 16.r,
                                                backgroundImage:
                                                    const AssetImage(
                                                      'assets/images/user.png',
                                                    ),
                                              ),
                                              horizontalSpace(8.w),
                                              Text(
                                                'Jana Hatem',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              RatingBarIndicator(
                                                rating: 3,
                                                itemCount: 5,
                                                itemSize: 20.sp,
                                                direction: Axis.horizontal,
                                                itemBuilder:
                                                    (context, _) => const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                              ),
                                              horizontalSpace(8.w),
                                              Text(
                                                '25/12/2024',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      verticalSpace(6.h),
                                      Text(
                                        'أحلى أكلة أكلتها من فترة! طازجة وصاخنة، والأسعار مناسبة جدًا...'
                                        'الخدمة كانت ممتازة والتعامل راقي جدًا من الشيف والداعم الفني.',
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 14.sp,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      verticalSpace(20.h),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Primarybutton(
                                          hight: 60.h,
                                          buttoncolor: Colors.orange,
                                          borderrediuse: 10.r,
                                          onpress: () => showRatingSheet(context),
                                          textcolor: Colors.white,
                                          buttontext: 'كتابة تعليق',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('خطأ في تحميل البيانات'));
            }
          },
        ),
      ),
    );
  }

  Widget buildIconBtn(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 40.w,
      height: 24.h,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white, size: 20.sp),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

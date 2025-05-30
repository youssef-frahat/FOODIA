import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/app_strings.dart';
import 'package:foodia_app/core/witgets/primary_button.dart';
import 'package:foodia_app/core/witgets/wiget_back.dart';
import 'package:foodia_app/features/cart/presentation/logic/cubit/add_to_cart_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../../../core/app_config/messages.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/extensions/spacing.dart';
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
  // bool isFollowing = false;
  bool isLoading = false; // To track the loading state
  bool get isUserFollowing {
    final state = context.read<AllFoodsCubit>().state;
    if (state is AllDetailsSucss) {
      return state.getAllDetalisResponseModel.data?.followChef ?? false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    getIt<AllFoodsCubit>()
                      ..getAllDetalisById(foodId: widget.foodId),
          ),
          BlocProvider(create: (context) => getIt<AddToCartCubit>()),
          // BlocProvider(create: (context) => getIt<ReviewsCubit>()),
        ],
        child: Builder(
          builder: (context) {
            return BlocListener<AllFoodsCubit, AllFoodsState>(
              listenWhen:
                  (previous, current) =>
                      current is FollowChef || current is FollowChefError,
              listener: (context, state) {
                if (state is FollowChef) {
                  setState(() => isLoading = false);

                  context.read<AllFoodsCubit>().getAllDetalisById(
                    foodId: widget.foodId,
                  );

                  AppMessages.showSuccess(
                    context,
                    AppStrings.followChefSuccess,
                  );
                } else if (state is FollowChefError) {
                  setState(() => isLoading = false);
                  AppMessages.showError(context, state.error);
                }
              },
              child: BlocBuilder<AllFoodsCubit, AllFoodsState>(
                buildWhen:
                    (previous, current) =>
                        current is AllDetailsSucss ||
                        current is AllDetailsError ||
                        current is AllDetailsLoading,
                builder: (context, state) {
                  if (state is AllDetailsLoading || isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is AllDetailsError) {
                    AppMessages.showError(context, state.error);
                    return Center(child: Text('حدث خطأ: ${state.error}'));
                  }

                  if (state is AllDetailsSucss) {
                    final details = state.getAllDetalisResponseModel;
                    final food = details.data?.food;
                    final chef = food?.chef;
                    final reviews = details.data?.reviews ?? [];

                    return Builder(
                      builder: (context) {
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
                                          onpress: () => context.pop(),
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
                                                  backgroundImage: NetworkImage(
                                                    "$imageUrl${details.data?.food?.chef?.image ?? ''}",
                                                  ),
                                                ),
                                                SizedBox(height: 6.h),
                                                Text(
                                                  details
                                                          .data
                                                          ?.food
                                                          ?.chef
                                                          ?.name ??
                                                      'اسم الشيف',
                                                  style: TextStyle(
                                                    color: Colors.orange,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                                verticalSpace(8.h),
                                                BlocBuilder<
                                                  AllFoodsCubit,
                                                  AllFoodsState
                                                >(
                                                  buildWhen:
                                                      (previous, current) =>
                                                          current
                                                              is AllDetailsSucss,
                                                  builder: (context, state) {
                                                    bool isUserFollowing =
                                                        false;
                                                    int chefId = 0;

                                                    if (state
                                                        is AllDetailsSucss) {
                                                      isUserFollowing =
                                                          state
                                                              .getAllDetalisResponseModel
                                                              .data
                                                              ?.followChef ??
                                                          false;
                                                      chefId =
                                                          state
                                                              .getAllDetalisResponseModel
                                                              .data
                                                              ?.food
                                                              ?.chef
                                                              ?.id ??
                                                          0;
                                                    }

                                                    return GestureDetector(
                                                      onTap:
                                                          isUserFollowing
                                                              ? null
                                                              : () {
                                                                setState(
                                                                  () =>
                                                                      isLoading =
                                                                          true,
                                                                );
                                                                context
                                                                    .read<
                                                                      AllFoodsCubit
                                                                    >()
                                                                    .followCefe(
                                                                      cefeId:
                                                                          chefId,
                                                                    );
                                                              },
                                                      child: Container(
                                                        padding:
                                                            REdgeInsets.symmetric(
                                                              horizontal: 12.w,
                                                              vertical: 6.h,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              isUserFollowing
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .orange,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10.r,
                                                              ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color:
                                                                  Colors
                                                                      .black26,
                                                              blurRadius: 5.r,
                                                            ),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              isUserFollowing
                                                                  ? Icons.check
                                                                  : Icons
                                                                      .person_add,
                                                              size: 16.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                              width: 8.w,
                                                            ),
                                                            Text(
                                                              isUserFollowing
                                                                  ? 'تم المتابعة'
                                                                  : 'متابعة',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors
                                                                        .white,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
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
                                                  topRight: Radius.circular(
                                                    30.r,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    30.r,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 40.h,
                                            left: 30.w,
                                            child: Container(
                                              margin: REdgeInsets.only(
                                                left: 8.w,
                                              ),
                                              padding: REdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 10.h,
                                              ),
                                              width: 250.w,
                                              height: 100.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    30.r,
                                                  ),
                                                  bottomLeft: Radius.circular(
                                                    30.r,
                                                  ),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 8.r,
                                                  ),
                                                ],
                                              ),
                                              child: BlocConsumer<
                                                AddToCartCubit,
                                                AddToCartState
                                              >(
                                                listener: (context, state) {
                                                  if (state
                                                      is AddToCartSuccess) {
                                                    AppMessages.showSuccess(
                                                      context,
                                                      AppStrings
                                                          .addToCartSuccess,
                                                    );
                                                  } else if (state
                                                      is AddToCartError) {
                                                    AppMessages.showError(
                                                      context,
                                                      state.error,
                                                    );
                                                  }
                                                },

                                                builder: (context, state) {
                                                  final num price =
                                                      num.tryParse(
                                                        details
                                                                .data
                                                                ?.food
                                                                ?.price
                                                                .toString() ??
                                                            '0',
                                                      ) ??
                                                      0;
                                                  final num total =
                                                      price * quantity;

                                                  return Column(
                                                    children: [
                                                      Text(
                                                        'السعر الاجمالي',
                                                        style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontFamily: 'Changa',
                                                        ),
                                                      ),
                                                      Text(
                                                        'ج.م${total.toStringAsFixed(0)}',
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: const Color(
                                                            0xFF4A4B4D,
                                                          ),
                                                        ),
                                                      ),
                                                      verticalSpace(10.h),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            buildIconBtn(
                                                              Icons.remove,
                                                              () {
                                                                if (quantity >
                                                                    1) {
                                                                  setState(
                                                                    () =>
                                                                        quantity--,
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            horizontalSpace(
                                                              16.w,
                                                            ),
                                                            Container(
                                                              width: 40.w,
                                                              height: 24.h,
                                                              decoration: BoxDecoration(
                                                                color:
                                                                    Colors
                                                                        .white,
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
                                                                    fontSize:
                                                                        15.sp,
                                                                    color: const Color(
                                                                      0xFFCA9744,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            horizontalSpace(
                                                              16.w,
                                                            ),
                                                            buildIconBtn(
                                                              Icons.add,
                                                              () {
                                                                setState(
                                                                  () =>
                                                                      quantity++,
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 65.h,
                                            right: 150.w,
                                            child: GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<AddToCartCubit>()
                                                    .addToCart(
                                                      foodId:
                                                          details
                                                              .data
                                                              ?.food
                                                              ?.id ??
                                                          0,
                                                      quantity: quantity,
                                                    );
                                              },
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
                                          ),
                                          Positioned(
                                            top: 180.h,
                                            left: 16.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'ج.م${details.data?.food?.price}',
                                                  style: TextStyle(
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                                Text(
                                                  'ج.م${details.data?.food?.offerPrice}',
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration
                                                            .lineThrough,
                                                    color: Colors.grey,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                                verticalSpace(8.h),
                                                Text(
                                                  details
                                                          .data
                                                          ?.food
                                                          ?.category
                                                          ?.name ??
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
                                                  details
                                                          .data
                                                          ?.food
                                                          ?.foodType ??
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
                                                      rating:
                                                          double.tryParse(
                                                            details
                                                                    .data
                                                                    ?.food
                                                                    ?.rating
                                                                    ?.toString() ??
                                                                '',
                                                          ) ??
                                                          0.0,
                                                      itemCount: 5,
                                                      itemSize: 24.sp,
                                                      direction:
                                                          Axis.horizontal,
                                                      itemBuilder:
                                                          (
                                                            context,
                                                            _,
                                                          ) => const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                          ),
                                                    ),
                                                    verticalSpace(5.h),
                                                    Text(
                                                      details.data?.food?.rating
                                                              .toString() ??
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
                                                  details
                                                          .data
                                                          ?.food
                                                          ?.description ??
                                                      'لا يوجد وصف متاح.',
                                                  style: TextStyle(
                                                    color: Colors.grey.shade800,
                                                    fontSize: 14.sp,
                                                  ),
                                                ),
                                                verticalSpace(50.h),
                                                verticalSpace(10.h),
                                                Text(
                                                  'التقييمات',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.sp,
                                                  ),
                                                ),
                                                verticalSpace(10.h),

                                                reviews.isEmpty
                                                    ? Text(
                                                      'لا توجد تقييمات بعد',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.grey,
                                                      ),
                                                    )
                                                    : ListView.separated(
                                                      shrinkWrap: true,
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount: reviews.length,
                                                      separatorBuilder:
                                                          (_, __) => Divider(
                                                            color:
                                                                Colors
                                                                    .grey
                                                                    .shade300,
                                                            height: 24,
                                                          ),
                                                      itemBuilder: (
                                                        context,
                                                        index,
                                                      ) {
                                                        final review =
                                                            reviews[index];
                                                        final reviewDate =
                                                            DateTime.tryParse(
                                                              review.createdAt ??
                                                                  '',
                                                            );
                                                        final formatted =
                                                            reviewDate != null
                                                                ? DateFormat(
                                                                  'dd/MM/yyyy',
                                                                  'ar',
                                                                ).format(
                                                                  reviewDate,
                                                                )
                                                                : 'تاريخ غير متاح';

                                                        return ListTile(
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          leading: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                                  '$imageUrl${review.userImage ?? ''}',
                                                                ),
                                                          ),
                                                          title: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                review.userName ??
                                                                    'مستخدم',
                                                                style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14.sp,
                                                                ),
                                                              ),
                                                              Text(
                                                                formatted,
                                                                style: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color:
                                                                      Colors
                                                                          .grey,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          subtitle: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RatingBarIndicator(
                                                                rating:
                                                                    (review.star ??
                                                                            0)
                                                                        .toDouble(),
                                                                itemCount: 5,
                                                                itemSize: 18.sp,
                                                                itemBuilder:
                                                                    (
                                                                      context,
                                                                      _,
                                                                    ) => const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color:
                                                                          Colors
                                                                              .amber,
                                                                    ),
                                                              ),
                                                              verticalSpace(
                                                                4.h,
                                                              ),
                                                              Text(
                                                                review.comment ??
                                                                    '',
                                                                style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color:
                                                                      Colors
                                                                          .black87,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  verticalSpace(20.h),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0,
                                      ),
                                      child: Primarybutton(
                                        textcolor: Colors.white,
                                        fontsize: 16.sp,
                                        borderrediuse: 8.r,
                                        buttontext: 'كتابة تعليق',
                                        buttoncolor: Colors.orange,
                                        fontWeight: FontWeight.w600,
                                        onpress: () {
                                          showRatingSheet(
                                            context,
                                            context,
                                            foodId: widget.foodId,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            );
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

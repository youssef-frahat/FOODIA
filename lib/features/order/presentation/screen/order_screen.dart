import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import 'package:foodia_app/core/extensions/spacing.dart';

import '../../../../core/app_config/messages.dart';
import '../logic/cubit/order_item_cubit.dart';
import '../reviews/cubit/review_button_cubit.dart';
import '../widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'طلباتي',
          style: TextStyle(fontFamily: 'Changa', fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<OrderItemCubit>()..getAllOrderItem(),
          ),
          BlocProvider(create: (context) => getIt<ReviewButtonCubit>()),
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocListener<ReviewButtonCubit, ReviewButtonState>(
            listener: (context, state) {
    if (state is ReviewButtonSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال التقييم بنجاح')),
      );
      context.read<OrderItemCubit>().getAllOrderItem();
      if (Navigator.canPop(context)) Navigator.pop(context);
    } else if (state is ReviewButtonError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    } else if (state is OrderItemReviewAlreadyDone) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
      if (Navigator.canPop(context)) Navigator.pop(context);
    }
  },
            child: BlocConsumer<OrderItemCubit, OrderItemState>(
              listener: (context, state) {
                if (state is OrderItemCancelSuccess) {
                  AppMessages.showSuccess(context, 'تم الغاء الطلب بنجاح');
                  context.read<OrderItemCubit>().getAllOrderItem();
                } else if (state is OrderItemCancelError) {
                  AppMessages.showError(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is OrderItemLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OrderItemError) {
                  return Center(child: Text(state.message));
                } else if (state is OrderItemLoaded) {
                  final orderItems = state.order.data;

                  if (orderItems == null || orderItems.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/nav_bar/cart.svg',
                            height: 100.h,
                            color: Colors.orange,
                          ),
                          verticalSpace(20),
                          Text(
                            'لا توجد طلبات حالياً',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: orderItems.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OrderItemWidget(
                        image: orderItems[index].food?.image ?? '',
                        title: orderItems[index].food?.name ?? '',
                        status: orderItems[index].chefStatus ?? '',
                        price: orderItems[index].subtotal.toString(),
                        quantity: orderItems[index].qty ?? 0,
                        deletOrder: () {
                          context.read<OrderItemCubit>().cancelOrder(
                            orderId: orderItems[index].id ?? 0,
                          );
                        },
                        onRate: () {
                          showRatingBottomSheet(
                            context,
                            orderItems[index].foodId ?? 0,
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  void showRatingBottomSheet(BuildContext context, int foodId) {
    final _commentController = TextEditingController();
    double _rating = 0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (bottomSheetContext) {
        final originalContext = context;

        return Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 20.h,
            bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom + 20,
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'قيم الطلب',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 30.sp,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1.0;
                          });
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 20.h),
                  TextField(
                    controller: _commentController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'اكتب تعليقك هنا...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange.shade700,
                          Colors.orange.shade400,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.r),
                        onTap: () {
                          if (_rating == 0) {
                            ScaffoldMessenger.of(originalContext).showSnackBar(
                              const SnackBar(
                                content: Text('من فضلك قم باختيار عدد النجوم'),
                              ),
                            );
                            return;
                          }
                          originalContext
                              .read<ReviewButtonCubit>()
                              .reviewsOrder(
                                foodId: foodId,
                                star: _rating.toInt().toString(),
                                comment:
                                    _commentController.text.isEmpty
                                        ? null
                                        : _commentController.text,
                              );
                        },
                        child: Center(
                          child: Text(
                            'إرسال التقييم',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

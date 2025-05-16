import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import 'package:foodia_app/core/extensions/spacing.dart';

import '../../../../core/app_config/messages.dart';
import '../logic/cubit/order_item_cubit.dart';
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
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/features/address/presentation/widget/stepprogress_bar_widget.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_config/app_colors.dart';
import '../../../../core/app_config/image_urls.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/witgets/primary_button.dart';
import '../logic/order/cubit/order_cubit.dart';
import 'order_item_card.dart';

class OrderDetails extends StatelessWidget {
  final int addressId;

  const OrderDetails({super.key, required this.addressId});

  double parseDouble(String value) {
    return double.tryParse(value) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<OrderCubit>()..getOrderDetails(),
          child: BlocBuilder<OrderCubit, OrderState>(
            builder: (context, state) {
              if (state is GetOrderLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetOrderFailure) {
                return Center(child: Text(state.failure.message));
              } else if (state is GetOrderScuccess) {
                final orders = state.order.data?.items ?? [];

                return Padding(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExactStepperWidget(currentStep: 1),
                    verticalSpace(30),
                      Expanded(
                        child: ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            final order = orders[index];
                            return OrderItemCard(
                              name: order.food?.name ?? '',
                              description: order.food?.description ?? '',
                              imageUrl: "$imageUrl${order.food?.image ?? ''}",
                              quantity: order.qty ?? 0,
                              price: parseDouble(order.food?.price ?? '0'),
                            );
                          },
                        ),
                      ),
                      verticalSpace(16),
                      Primarybutton(
                        buttontext: 'التالي',
                        borderrediuse: 50,
                        buttoncolor: AppColors.primarycolor,
                        fontsize: 16,
                        hight: 50,
                        width: 300,
                        onpress: () {
                          context.pushNamed(AppRoutes.payment, extra: addressId);
                        },
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox(); // fallback
            },
          ),
        ),
      ),
    );
  }
}

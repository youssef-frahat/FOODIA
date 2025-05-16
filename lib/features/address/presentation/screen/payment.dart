import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/app_colors.dart';
import 'package:foodia_app/core/app_config/messages.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import 'package:foodia_app/core/extensions/spacing.dart';
import 'package:foodia_app/core/witgets/primary_button.dart';
import 'package:foodia_app/features/address/presentation/widget/stepprogress_bar_widget.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../wallet/presentation/widget/payment_web_view.dart';
import '../logic/payment/cubit/pay_ment_order_cubit.dart';

class PaymentScreen extends StatefulWidget {
  final int total;
  final int orderId;

  const PaymentScreen({super.key, required this.total, required this.orderId});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedMethod = 0;
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PayMentOrderCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ExactStepperWidget(currentStep: 2),
                verticalSpace(60),

                // السعر
                Container(
                  width: 300.w,
                  height: 120.h,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primarycolor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'التكلفة الكلية',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Changa',
                        ),
                      ),
                      verticalSpace(8),
                      Text(
                        '${widget.total} جنيه',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primarycolor,
                          fontFamily: 'Changa',
                        ),
                      ),
                    ],
                  ),
                ),

                verticalSpace(80),
                Text(
                  'حدد نوع عملية الدفع',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primarycolor,
                    fontFamily: 'Changa',
                  ),
                ),
                verticalSpace(80),

                Row(
                  children: [
                    _buildPaymentCard(
                      label: 'الدفع بواسطة Credit Card',
                      image: 'assets/images/credit_cad.png',
                      value: 1,
                    ),
                    SizedBox(width: 16.w),
                    _buildPaymentCard(
                      label: 'الدفع من خلال التطبيق',
                      image: 'assets/images/mobile_wallet.png',
                      value: 0,
                    ),
                  ],
                ),

                const Spacer(),

                BlocConsumer<PayMentOrderCubit, PayMentOrderState>(
                  listener: (context, state) async {
                    if (state is PayMentOrderSuccess) {
                      final url = state.response.paymentUrl;

                      if (url != null) {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebViewPaymentPage(url: url),
                          ),
                        );

                        if (result == true) {
                          AppMessages.showSuccess(context, 'تم الدفع بنجاح');
                          context.goNamed(AppRoutes.home);
                        } else {
                          AppMessages.showError(
                            context,
                            'تم إلغاء الدفع أو فشل العملية',
                          );
                        }
                      } else {
                        AppMessages.showSuccess(context, 'تم الدفع بنجاح');
                        context.goNamed(AppRoutes.home);
                      }

                      setState(() => isProcessing = false);
                    } else if (state is PayMentOrderFailure) {
                      AppMessages.showError(context, state.error);
                      setState(() => isProcessing = false);
                    }
                  },
                  builder: (context, state) {
                    return Primarybutton(
                      buttontext:
                          isProcessing ? 'جاري الدفع...' : 'اختيار الدفع',
                      borderrediuse: 50,
                      buttoncolor: AppColors.primarycolor,
                      fontsize: 16,
                      hight: 50,
                      width: double.infinity,
                      onpress:
                          isProcessing
                              ? null
                              : () {
                                if (selectedMethod == null) return;

                                setState(() => isProcessing = true);

                                final paymentType =
                                    selectedMethod == 0 ? 'wallet' : 'credit';

                                context.read<PayMentOrderCubit>().makePayment(
                                  orderId: widget.orderId,
                                  payment: paymentType,
                                );
                              },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentCard({
    required String label,
    required String image,
    required int value,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedMethod = value),
        child: Container(
          height: 130.h,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  selectedMethod == value
                      ? AppColors.primarycolor
                      : Colors.grey,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image, height: 40.h, width: 40.w),
                  verticalSpace(8),
                  Text(
                    label,
                    style: TextStyle(fontSize: 13.sp, fontFamily: 'Changa'),
                  ),
                ],
              ),
              if (selectedMethod == value)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 22.sp,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

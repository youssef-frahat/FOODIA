import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodia_app/features/address/presentation/widget/stepprogress_bar_widget.dart';

import '../../../../core/app_config/app_colors.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/primary_button.dart';

class PaymentScreen extends StatefulWidget {
  final int addressId;

  const PaymentScreen({super.key, required this.addressId});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ExactStepperWidget(currentStep: 2),
              verticalSpace(60),

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
                      '200 جنيه',
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

              Align(
                alignment: Alignment.center,
                child: Text(
                  'حدد نوع عملية الدفع',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primarycolor,
                    fontFamily: 'Changa',
                  ),
                ),
              ),
              verticalSpace(80),

              Row(
                children: [
                   Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedMethod = 1),
                      child: Container(
                         height: 130.h,
                        width: 190.w,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedMethod == 0
                                ? AppColors.primarycolor
                                : Colors.grey,width: 4
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                           Image.asset('assets/images/credit_cad.png', height: 40.h, width: 40.w),
                            verticalSpace(8),
                            Text(
                              'الدفع بواسطة Credit Card',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Changa',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedMethod = 0),
                      child: Container(
                        height: 130.h,
                        width: 190.w,
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedMethod == 1
                                ? AppColors.primarycolor
                                : Colors.grey, width: 4
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            Image.asset('assets/images/mobile_wallet.png', height: 40.h, width: 40.w),
                            verticalSpace(8),
                            Text(
                              'الدفع من خلال التطبيق',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'Changa',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                 
                ],
              ),

              const Spacer(),

              Primarybutton(
                buttontext: 'اختيار الدفع',
                borderrediuse: 50,
                buttoncolor: AppColors.primarycolor,
                fontsize: 16,
                hight: 50,
                width: double.infinity,
                onpress: () {
                  // هنا تحط الأكشن الفعلي
                  if (selectedMethod == null) {
                    // show error
                  } else {
                    // proceed with payment
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

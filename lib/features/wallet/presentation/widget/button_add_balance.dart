import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/spacing.dart';
import '../../../../core/witgets/custom_text_field.dart';
import '../../../../core/witgets/primary_button.dart';
import '../logic/cubit/get_balance_cubit.dart';

class ButtonAddBalance extends StatelessWidget {
  const ButtonAddBalance({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.watch<GetBalanceCubit>().state is AddingBalanceLoading;

    return Center(
      child: ElevatedButton(
        onPressed: isLoading ? null : () => _showDialog(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child:
            isLoading
                ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
                : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'أضف رصيد لمحفظتك',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontFamily: 'Changa',
                      ),
                    ),
                    horizontalSpace(10),
                    SvgPicture.asset('assets/icons/add_wallet.svg'),
                  ],
                ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    final amountController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: Text(
            'أضف مبلغًا جديدًا',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          content: Padding(
            padding: REdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyTextFormField(
                  controller: amountController,
                  hintText: 'ادخل المبلغ',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'يرجى إدخال المبلغ';
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                Primarybutton(
                  buttontext: 'أضف',
                  buttoncolor: Colors.orange,
                  onpress: () {
                    final amount = int.tryParse(amountController.text);
                    if (amount != null && amount > 0) {
                      Navigator.pop(dialogContext);
                      context.read<GetBalanceCubit>().addBalance(
                        amount: amount,
                      );
                    } else {
                      ScaffoldMessenger.of(dialogContext).showSnackBar(
                        const SnackBar(content: Text('يرجى إدخال مبلغ صحيح')),
                      );
                    }
                  },
                  width: 100.w,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

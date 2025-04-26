
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/app_strings.dart';
import 'package:foodia_app/core/extensions/spacing.dart';
import 'package:foodia_app/core/witgets/wiget_back.dart';

import '../../../../../core/app_config/app_colors.dart';
import '../../../../../core/app_config/font_styles.dart';
import '../../../../../core/witgets/custom_text_field.dart';
import '../../../../../core/witgets/primary_button.dart';

class ForgotpasswordScreen extends StatelessWidget {
  const ForgotpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
           padding: REdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children:  [
              CustomWigetArrowBack(),
              verticalSpace(15),
              Text(
                AppStrings.forgotPasswordtex,
                style: FontStyles.body28W600
              ),
              verticalSpace(20),
              Image.asset(
                'assets/images/forgotPassword.png',
              ),
              verticalSpace(30),
              Text(
                AppStrings.forgotPasswordBody,
                style: FontStyles.body15W300
              ),
              verticalSpace(50),
              MyTextFormField(
                    hintText: AppStrings.phone,
                    // controller: _phoneController,
                    keyboardType: TextInputType.phone,

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.pleaseEnterYourPhone;
                      }
                      if (value.length < 10) {
                        return 'رقم الهاتف يجب أن يكون 10 أرقام على الأقل';
                      }
                      return null;
                    },
                  ),
              verticalSpace(80),
               Primarybutton(
                    buttontext: AppStrings.sendCode,
                    buttoncolor: AppColors.primarycolor,
                    hight: 48.h,
                    borderrediuse: 50.r,
                    textcolor: Colors.white,
                    onpress: () {
                     
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
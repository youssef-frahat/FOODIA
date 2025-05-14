import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/app_strings.dart';
import 'package:foodia_app/core/extensions/spacing.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_config/app_colors.dart';
import '../../../../../core/app_config/font_styles.dart';
import '../../../../../core/app_config/messages.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/witgets/custom_text_field.dart';
import '../../../../../core/witgets/primary_button.dart';
import '../logic/forgetPassword/cubit/forget_password_cubit.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: SafeArea(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                if (state is ForgetPasswordSuccess) {
                  isProcessing = false;
                  context.goNamed(
                    AppRoutes.otpScreen,
                    extra: _phoneController.text.trim(),
                  );
                } else if (state is ForgetPasswordError) {
                  isProcessing = false;
                  AppMessages.showError(context, state.message);
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // CustomWigetArrowBack(),
                      verticalSpace(15),
                      Text(
                        AppStrings.forgotPasswordtex,
                        style: FontStyles.body28W600,
                      ),
                      verticalSpace(20),
                      Image.asset('assets/images/forgotPassword.png'),
                      verticalSpace(30),
                      Text(
                        AppStrings.forgotPasswordBody,
                        style: FontStyles.body15W300,
                      ),
                      verticalSpace(50),
                      MyTextFormField(
                        hintText: AppStrings.phone,
                        controller: _phoneController,
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
                      (state is ForgetPasswordLoading || isProcessing)
                          ? const CircularProgressIndicator()
                          : Primarybutton(
                            buttontext: AppStrings.sendCode,
                            buttoncolor: AppColors.primarycolor,
                            hight: 48.h,
                            borderrediuse: 50.r,
                            textcolor: Colors.white,
                            onpress: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                isProcessing = true;
                                context
                                    .read<ForgetPasswordCubit>()
                                    .forgetPassword(
                                      phone: _phoneController.text.trim(),
                                    );
                              }
                            },
                          ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

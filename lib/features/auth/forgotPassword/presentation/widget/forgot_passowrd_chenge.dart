import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_config/app_colors.dart';
import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/app_config/messages.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/extensions/spacing.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/witgets/custom_text_field.dart';
import '../../../../../core/witgets/primary_button.dart';
import '../logic/forgetPassword/cubit/forget_password_cubit.dart';

class ForgotPassowrdChenge extends StatefulWidget {
  final String phoneNumber;
  const ForgotPassowrdChenge({super.key, required this.phoneNumber});

  @override
  State<ForgotPassowrdChenge> createState() => _ForgotPassowrdChengeState();
}

class _ForgotPassowrdChengeState extends State<ForgotPassowrdChenge> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "اعادة تعيين كلمة المرور",
          style: TextStyle(fontFamily: 'Changa', fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordLoading) {
              AppMessages.showLoading(context);
            } else if (state is ResetPasswordSuccess) {
              context.pop();
              AppMessages.showSuccess(context, "تم تغيير كلمة المرور بنجاح");
              context.goNamed(AppRoutes.login);
            } else if (state is ResetPasswordError) {
              context.pop();
              AppMessages.showError(context, state.message);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    verticalSpace(150),
                    MyTextFormField(
                      hintText: 'ادخل كلمة السر',
                      isPassword: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.pleaseEnterYourPassword;
                        }
                        if (value.length < 6) {
                          return 'كلمة المرور يجب أن تكون 6 أحرف أو أكثر';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(20),
                    MyTextFormField(
                      hintText: 'تاكد كلمة السر',
                      isPassword: true,
                      controller: _passwordConfirmController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return AppStrings.pleaseEnterYourPassword;
                        }
                        if (value.length < 6) {
                          return 'كلمة المرور يجب أن تكون 6 أحرف أو أكثر';
                        }
                        return null;
                      },
                    ),
                    verticalSpace(50),
                    Primarybutton(
                      buttontext: 'اعادة تعين كلمة السر',
                      buttoncolor: AppColors.primarycolor,
                      hight: 48.h,
                      borderrediuse: 50.r,
                      textcolor: Colors.white,
                      onpress:
                          state is ResetPasswordLoading
                              ? null
                              : () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  if (_passwordController.text.trim() !=
                                      _passwordConfirmController.text.trim()) {
                                    AppMessages.showError(
                                      context,
                                      "كلمة المرور غير متطابقة",
                                    );
                                    return;
                                  }
                                  context
                                      .read<ForgetPasswordCubit>()
                                      .resetPassword(
                                        phone: widget.phoneNumber,
                                        password:
                                            _passwordController.text.trim(),
                                        conPassword:
                                            _passwordConfirmController.text
                                                .trim(),
                                      );
                                }
                              },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

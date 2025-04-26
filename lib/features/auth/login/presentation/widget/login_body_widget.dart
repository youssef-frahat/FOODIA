import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/app_config/font_styles.dart';
import '../../../../../core/app_config/messages.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/extensions/spacing.dart';
import '../../../../../core/app_config/app_assets.dart';
import '../../../../../core/app_config/app_colors.dart';

import '../../../../../core/witgets/custom_text_field.dart';
import '../../../../../core/witgets/primary_button.dart';
import '../logic/cubit/login_user_cubit.dart';
import 'remember_me_row.dart';
import 'signup_prompt_row.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({super.key});

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  bool _isRememberMeChecked = true;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginUserCubit>(),
      child: BlocConsumer<LoginUserCubit, LoginUserState>(
        listener: (context, state) {
          if (state is LoginUserLoading) {
            AppMessages.showLoading(context);
          } else if (state is LoginUserSuccess) {
            Navigator.of(context).pop();
            AppMessages.showSuccess(context, AppStrings.loginSuccess);
            context.go(AppRoutes.bottomNavBar);
          } else if (state is LoginUserError) {
            Navigator.of(context).pop();
            AppMessages.showError(context, state.error);
            log("error from state ${state.error}");
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                children: [
                  verticalSpace(120),
                  Center(
                    child: Image.asset(
                      AppAssets.logo,
                      width: 186.w,
                      height: 186.h,
                    ),
                  ),
                  Text(
                    AppStrings.login,
                    textAlign: TextAlign.center,
                    style: FontStyles.body32W600,
                  ),
                  verticalSpace(70),
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
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.password,
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
                  verticalSpace(10),
                  RememberMeRow(
                    onRememberChanged: (bool value) {
                      setState(() {
                        _isRememberMeChecked = value;
                      });
                    },
                  ),
                  verticalSpace(20),
                  Primarybutton(
                    buttontext: AppStrings.login,
                    buttoncolor: AppColors.primarycolor,
                    hight: 48.h,
                    borderrediuse: 50.r,
                    textcolor: Colors.white,
                    onpress: () {
                      if (!_isRememberMeChecked) {
                        AppMessages.showError(
                          context,
                          'يجب الموافقة على شرط تذكرني أولاً',
                        );
                        return;
                      }
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginUserCubit>().login(
                          phone: _phoneController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                      }
                    },
                  ),
                  verticalSpace(20),
                  SignupPromptRow(
                    onSignupTap: () {
                      context.pushNamed(AppRoutes.signinScreen);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

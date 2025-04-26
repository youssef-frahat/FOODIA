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
import '../../../../../core/witgets/wiget_back.dart';
import '../logic/cubit/signin_user_cubit.dart';

class SigninBodyWidget extends StatefulWidget {
  const SigninBodyWidget({super.key});

  @override
  State<SigninBodyWidget> createState() => _SigninBodyWidgetState();
}

class _SigninBodyWidgetState extends State<SigninBodyWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SigninUserCubit>(),
      child: BlocConsumer<SigninUserCubit, SigninUserState>(
        listener: (context, state) {
          if (state is SigninUserLoading) {
            AppMessages.showLoading(context);
          } else if (state is SigninUserSuccess) {
            Navigator.of(context).pop();
            AppMessages.showSuccess(context, AppStrings.registerSuccess);
            context.pushNamed(
              AppRoutes.otpScreen,
              extra: _phoneController.text.trim(),
            );
          } else if (state is SigninUserError) {
            Navigator.of(context).pop();
            AppMessages.showError(context, AppStrings.emailAlreadyExists);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                children: [
                  CustomWigetArrowBack(
                    onpress: () {
                      context.pop();
                    },
                  ),
                  verticalSpace(20),
                  Center(
                    child: Image.asset(
                      AppAssets.logo,
                      width: 186.w,
                      height: 186.h,
                    ),
                  ),
                  Text(
                    AppStrings.register,
                    textAlign: TextAlign.center,
                    style: FontStyles.body32W600,
                  ),
                  verticalSpace(30),
                  MyTextFormField(
                    hintText: AppStrings.name,
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.pleaseEnterYourName;
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.phone,
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.pleaseEnterYourPhone;
                      }
                      if (value.length < 10) {
                        return 'يجب أن يتكون رقم الهاتف من 11 رقم';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return AppStrings.pleaseEnterYourEmail;
                      }
                      if (!value.contains('@')) {
                        return 'البريد الإلكتروني غير صالح';
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
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterYourPassword;
                      }
                      if (value.length < 6) {
                        return 'يجب أن تتكون كلمة المرور من 6 أحرف على الأقل';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.confarmPassword,
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.pleaseEnterYourConfarmPassword;
                      }
                      if (value != _passwordController.text) {
                        return 'كلمة المرور غير متطابقة';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(30),
                  Primarybutton(
                    buttontext: 'تسجيل',
                    buttoncolor: AppColors.primarycolor,
                    hight: 48.h,
                    borderrediuse: 50.r,
                    textcolor: Colors.white,
                    onpress: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<SigninUserCubit>().register(
                          name: _nameController.text.trim(),
                          phone: _phoneController.text.trim(),
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          passwordConfirmation: _confirmPasswordController.text.trim(),
                        );
                      }
                    },
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

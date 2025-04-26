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
  late TextEditingController _nameController,
      _phoneController,
      _emailController,
      _passwordController,
      _confarmPasswordController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confarmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confarmPasswordController.dispose();
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
            context.pushNamed(
              AppRoutes.otpScreen,
              extra: _phoneController.text.trim(),
            );

            Navigator.of(context).pop();
            AppMessages.showSuccess(context, AppStrings.registerSuccess);
          } else if (state is SigninUserError) {
            Navigator.of(context).pop();
            AppMessages.showError(context, AppStrings.emailAlreadyExists);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
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
                    isObscure: false,
                    controller: _nameController,
                    onChanged: (value) {
                      _nameController.text = value;
                    },
                    suffixIcon: const Icon(Icons.person),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleaseEnterYourName;
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.phone,
                    isObscure: false,
                    suffixIcon: const Icon(Icons.phone),
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
                    onChanged: (value) {
                      _phoneController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleaseEnterYourPhone;
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.email,
                    isObscure: false,
                    controller: _emailController,
                    onChanged: (value) {
                      _emailController.text = value;
                    },
                    suffixIcon: const Icon(Icons.mail),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleaseEnterYourEmail;
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.password,
                    isObscure: true,
                    suffixIcon: const Icon(Icons.visibility_off),
                    controller: _passwordController,
                    onChanged: (value) {
                      _passwordController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleaseEnterYourPassword;
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  MyTextFormField(
                    hintText: AppStrings.confarmPassword,
                    isObscure: true,
                    suffixIcon: const Icon(Icons.visibility_off),
                    controller: _confarmPasswordController,
                    onChanged: (value) {
                      _confarmPasswordController.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.pleaseEnterYourConfarmPassword;
                      }
                      return null;
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
                      // if (_formKey.currentState!.validate()) {
                      //   context.read<SigninUserCubit>().register(
                      //     name: _nameController.text,
                      //     phone: _phoneController.text,
                      //     email: _emailController.text,
                      //     password: _passwordController.text,
                      //     passwordConfirmation: _confarmPasswordController.text,
                      //   );
                      // }
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<SigninUserCubit>().register(
                          name: _nameController.text,
                          phone: _phoneController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          passwordConfirmation: _confarmPasswordController.text,
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

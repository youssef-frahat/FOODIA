import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import '../../../../core/app_config/messages.dart';
import '../../../../core/extensions/spacing.dart';
import '../logic/cubit/user_profile_cubit.dart';
import 'profile_field.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<UserProfileCubit>();
        cubit.getUserProfile();
        return cubit;
      },
      child: BlocConsumer<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          if (state is UserProfileLoading) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AppMessages.showLoading(context);
            });
          } else if (state is UserProfileError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (Navigator.canPop(context)) {
                Navigator.of(context, rootNavigator: true).pop();
              }
              AppMessages.showError(context, state.error);
            });
          } else if (state is UserProfileLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (Navigator.canPop(context)) {
                Navigator.of(context, rootNavigator: true).pop();
              }
            });
          }
        },

        builder: (context, state) {
          if (state is UserProfileLoaded) {
            final userProfile = state.userProfile.data;
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        verticalSpace(25),
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage: NetworkImage(
                            userProfile?.image?.isNotEmpty == true
                                ? userProfile!.image!
                                : "https://imgs.search.brave.com/CbGx149KMAUXiJtL17989JkvB2aupjBKAvcBtUva0Yc/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzEyLzM1Lzc3LzY0/LzM2MF9GXzEyMzU3/NzY0NDFfakR5RHRZ/amNxdnhSV2RySnBv/aGp4b1YwRGRmdTVY/YWsuanBn",
                          ),
                        ),
                        verticalSpace(12),
                        Text(
                          userProfile?.name ?? 'اسم غير متوفر',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(4),
                        Text(
                          userProfile?.email ?? 'البريد الإلكتروني غير متوفر',
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: 60,
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange.withOpacity(0.2),
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 16.sp,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(30),
                ProfileField(
                  title: 'الاسم:',
                  value: userProfile?.name ?? 'اسم غير متوفر',
                ),
                ProfileField(
                  title: 'رقم الهاتف:',
                  value: userProfile?.phone ?? 'رقم الهاتف غير متوفر',
                ),
                ProfileField(
                  title: 'البريد الالكتروني:',
                  value: userProfile?.email ?? 'البريد الإلكتروني غير متوفر',
                ),
                ProfileField(
                  title: 'الرصيد :',
                  value: userProfile?.wallet ?? 'الرصيد غير متوفر',
                ),
                verticalSpace(40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // إضافة المنطق الخاص بتسجيل الخروج هنا
                    },
                    icon: Icon(Icons.logout, color: Colors.red),
                    label: Text(
                      'تسجيل الخروج',
                      style: TextStyle(color: Colors.red, fontSize: 16.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: Colors.red, width: 2.0.w),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      elevation: 0,
                    ),
                  ),
                ),
                verticalSpace(20),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/image_urls.dart';
import 'package:foodia_app/core/extensions/spacing.dart';
import 'package:foodia_app/core/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/dependency_injection.dart';
import '../logic/cubit/all_followers_cubit.dart';
import '../widget/food_card.dart';

class ChefProfileScreen extends StatelessWidget {
  final int cefeId;
  const ChefProfileScreen({super.key, required this.cefeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AllFollowersCubit>()..getProfileChefe(chefId: cefeId),
        child: BlocBuilder<AllFollowersCubit, AllFollowersState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is GetProfileChefeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProfileChefeFailure) {
              return Center(child: Text('حدث خطأ: ${state.error}'));
            } else if (state is GetProfileChefeSuccess) {
              final profileChefe = state.chefeProfileModel.data ?? null;
              
             
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/images/det_chefe.png',
                      fit: BoxFit.cover,
                      height: 160.h,
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
                    child: Column(
                      children: [
                        CustomWigetArrowBack(
                          onpress: () {
                            context.pop(context);
                          },
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 50.r,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage: NetworkImage(
                                      '$imageUrl${profileChefe?.chef?.image ?? ''}',
                                    ),
                                  ),
                                ),
                                verticalSpace(10),
                                Text(
                                  profileChefe?.chef?.name ?? 'لا يوجد اسم',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            horizontalSpace(20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  verticalSpace(30),
                                  Text(
                                    profileChefe?.chef?.bio ?? 'لا يوجد نبذة',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      height: 1.5,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  verticalSpace(20),
                                  Row(
                                    children: [
                                      Spacer(),
                                      Text(
                                        "${profileChefe?.chef?.countSubscribe.toString()} متابع",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      horizontalSpace(20),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 12.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                        ),
                                        child: Text(
                                          'إلغاء المتابعة',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        horizontalSpace(10),
                        Divider(color: Colors.orangeAccent),
                        horizontalSpace(10),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 16.h),
                            itemCount: profileChefe?.foods?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final foodItem = profileChefe?.foods?.data?[index];
                              return FoodCard(
                                name: foodItem?.name ?? 'لا يوجد اسم للوجبة',
                                description: foodItem?.description ?? 'لا يوجد وصف',
                                imageUrl: '${imageUrl}${foodItem?.image ?? ''}',
                                price: foodItem?.price ?? '0',
                                foodType: foodItem?.foodType ?? 'غير محدد',
                                offerPrice: foodItem?.offerPrice ?? '0',
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

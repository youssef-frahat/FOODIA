import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/image_urls.dart';
import 'package:foodia_app/core/routing/app_routes.dart';
import 'package:foodia_app/features/followers/presentation/logic/cubit/all_followers_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/spacing.dart';

class ListViewBuilderCefi extends StatelessWidget {
  const ListViewBuilderCefi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFollowersCubit, AllFollowersState>(
      builder: (context, state) {
        if (state is AllFollowersChefe) {
          final chefs = state.followers.data;

          if (chefs == null || chefs.isEmpty) {
            return Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.group_outlined,
                      size: 64.sp,
                      color: Colors.orange,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'لا توجد شيفات لعرضها.',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange,
                        fontFamily: 'Changa',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Expanded(
            child: ListView.separated(
              itemCount: chefs.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                final chef = chefs[index];

                return Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      final result = await context.push(
                        AppRoutes.followDetails,
                        extra: chef.id,
                      );

                      if (result == true) {
                        context.read<AllFollowersCubit>().fetchFollowers();
                      }
                    },

                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      height: 100.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: Colors.orange, width: 2.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage: NetworkImage(
                              '$imageUrl${chef.image}',
                            ),
                          ),
                          SizedBox(width: 12.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chef.name ?? '',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Changa',
                                  ),
                                ),
                                verticalSpace(10),
                                Text(
                                  chef.bio ?? '',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                    fontFamily: 'Changa',
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),

                          Row(
                            children: [
                              Icon(
                                Icons.people,
                                color: Colors.orange,
                                size: 20.sp,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '${chef.countSubscribe}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: Colors.orange,
                                  fontFamily: 'Changa',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is AllFollowersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllFollowersFailure) {
          return Center(child: Text(state.error));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

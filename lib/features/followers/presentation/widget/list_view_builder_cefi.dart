import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodia_app/core/app_config/image_urls.dart';
import 'package:foodia_app/features/followers/presentation/logic/cubit/all_followers_cubit.dart';

import '../../../../core/extensions/spacing.dart';

class ListViewBuilderCefi extends StatelessWidget {
  const ListViewBuilderCefi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllFollowersCubit, AllFollowersState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is GetAllFollowersChefeSuccess) {
          final chefs = state.getAllFollowersChefeModel.data!.chefs ?? [];

          return Padding(
            padding: REdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 120.h,
              child: ListView.builder(
                itemCount: chefs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () =>  context.read<AllFollowersCubit>().selectChef(chefs[index].id!),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          height: 90.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                '${imageUrl}${chefs[index].image}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        verticalSpace(8),
                        Text(
                          chefs[index].name ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                            fontFamily: 'Changa',
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is GetAllFollowersChefeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllFollowersChefeFailure) {
          return Center(child: Text('حدث خطأ: ${state.error}'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependency_injection.dart';
import '../logic/get_all_categorys_logic/cubit/get_all_categorys_cubit.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<GetAllCategorysCubit>();
        cubit.getAllCategorys();
        return cubit;
      },
      child: BlocBuilder<GetAllCategorysCubit, GetAllCategorysState>(
        builder: (context, state) {
          if (state is GetAllCategorysLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetAllCategorysError) {
            return Center(child: Text(state.message));
          }

          if (state is GetAllCategorysLoaded) {
            final categories = state.categories.data;

            if (categories == null || categories.data!.isEmpty) {
              return const Center(child: Text('لا توجد بيانات متاحة'));
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "عرض الكل",
                        style: TextStyle(
                          color: const Color(0xFFB54427),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Changa',
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "الأصناف",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Changa',
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  height: 120.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    itemCount: categories.data!.length,
                    separatorBuilder: (_, __) => SizedBox(width: 16.w),
                    itemBuilder: (context, index) {
                      final String imageUrl =
                          "https://mangamediaa.com/house-food/public/";
                      final item = categories.data![index];
                      return Column(
                        children: [
                          ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: "$imageUrl${item.image}",
                              width: 90.w,
                              height: 90.h,
                              placeholder:
                                  (context, url) => Container(
                                    width: 80.w,
                                    height: 80.h,
                                    alignment: Alignment.center,
                                    child: const CircularProgressIndicator(),
                                  ),
                              errorWidget:
                                  (context, url, error) => Container(
                                    width: 80.w,
                                    height: 80.h,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.broken_image),
                                  ),
                            ),
                          ),

                          SizedBox(height: 8.h),
                          Text(
                            item.name ?? 'اسم غير متوفر',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Changa',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox(); // fallback empty widget
        },
      ),
    );
  }
}

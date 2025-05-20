import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodia_app/core/app_config/app_assets.dart';
import 'package:foodia_app/core/di/dependency_injection.dart';
import 'package:foodia_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../logic/home_foods/cubit/all_foods_cubit.dart';
import '../widget/home_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AllFoodsCubit>()..getAllFoods(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFF8F8F8),
          actions: [
            IconButton(
              icon: SvgPicture.asset(AppAssets.cartSvg),
              onPressed: () {
                context.push(AppRoutes.cartScreen);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                //! Handle notification button press
              },
            ),
          ],
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}

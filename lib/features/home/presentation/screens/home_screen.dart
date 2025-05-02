import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodia_app/core/app_config/app_assets.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../widget/home_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF8F8F8),
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
              // Handle notification button press
            },
          ),
        ],
      ),
      body: HomeViewBody(),
    );
  }
}

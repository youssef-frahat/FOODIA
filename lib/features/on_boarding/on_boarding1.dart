import 'package:flutter/material.dart';

import 'package:foodia_app/core/routing/app_routes.dart';
import 'package:foodia_app/core/app_config/app_assets.dart';

import 'package:foodia_app/core/witgets/primary_button.dart';
import 'package:go_router/go_router.dart';

import '../../core/app_config/app_fonts.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.onbording,
                ), // Use the image from assets
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),

          //========================== Skip Button =====================
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).pushReplacementNamed(AppRoutes.login);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: AppFonts.mainfontsname,
                ),
              ),
            ),
          ),

          // ================ Title ===============
          // Center(
          //   child: Positioned(
          //     bottom: 100,
          //     left: 20,
          //     right: 20,
          //     child: Text(
          //       "Hello ",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 70,
          //         fontFamily: AppFonts.mainfontsname,
          //       ),
          //     ),
          //   ),
          // ),

          // Next Button (Bottom)
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Primarybutton(
              onpress: () {
                GoRouter.of(context).pushReplacementNamed(AppRoutes.login);
              },
              buttontext: "Start Now",
              fontsize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:foodia_app/core/routing/app_routes.dart';
import 'package:foodia_app/core/styling/app_assets.dart';

import 'package:foodia_app/core/styling/app_styling.dart';
import 'package:foodia_app/core/witgets/primary_button.dart';
import 'package:go_router/go_router.dart';

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
                GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
              },
              child: Text("Skip", style: AppStyling.primarytextstyle),
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
                GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
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

import 'package:flutter/material.dart';
import 'package:foodia_app/styling/app_assets.dart';
import 'package:foodia_app/styling/app_colors.dart';
import 'package:foodia_app/styling/app_fonts.dart';
import 'package:foodia_app/witgets/primary_button.dart';
import 'package:foodia_app/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';

class SucessPass extends StatelessWidget {
  const SucessPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            // ======================= click back =============
      appBar: AppBar(
        leading: WigetBack(
          onpress: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      backgroundColor: AppColors.backgroundcolor,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //====================== photo =============================
                    SizedBox(
                      width: 186,
                      height: 186,
                      child: Image.asset(AppAssets.image, fit: BoxFit.contain),
                    ),
                    SizedBox(height: 80),
                    //================= Text ===================================
                    Text(
                      "Password Updated Sucessfully ",
                      style: TextStyle(
                        fontFamily: AppFonts.mainfontsname,
                        fontSize: 25,
                        color: AppColors.primarycolor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 100),
                    //======================== Ok Button =======================
                    Primarybutton(
                      onpress: () {},
                      buttontext: "OK",
                      fontsize: 28,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

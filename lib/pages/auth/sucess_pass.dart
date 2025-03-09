import 'package:flutter/material.dart';
import 'package:foodia_app/styling/app_assets.dart';
import 'package:foodia_app/styling/app_colors.dart';
import 'package:foodia_app/styling/app_styling.dart';
import 'package:foodia_app/witgets/primary_putton.dart';
import 'package:foodia_app/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';

class SucessPass extends StatelessWidget {
  const SucessPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    // ================ Click back ===========================
                    Padding(
                      padding: const EdgeInsets.only(right: 320, bottom: 250),
                      child: WigetBack(
                        onpress: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                    ),

                    // SizedBox(height: 250),
                    SizedBox(
                      width: 186,
                      height: 186,
                      child: Image.asset(AppAssets.image, fit: BoxFit.contain),
                    ),
                    //================= Text =================================
                    Text(
                      " The Password Updated Sucessfully ",
                      style: AppStyling.primarytextstyle,
                    ),

                    SizedBox(height: 20),
                    //======================== Ok Button ==================
                    PrimaryPutton(
                      onpress: () {},
                      // onpress: () => _registerUser(context),
                      buttontext: "Accep",
                      fontsize: 23,
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

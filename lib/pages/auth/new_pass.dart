import 'package:flutter/material.dart';
import 'package:foodia_app/routing/app_routes.dart';

import 'package:foodia_app/styling/app_colors.dart';

import 'package:foodia_app/styling/app_styling.dart';
import 'package:foodia_app/witgets/custom_text_field.dart';
import 'package:foodia_app/witgets/primary_putton.dart';
import 'package:foodia_app/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  bool ispassword = true;
  bool iscpassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Form(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // ================ Click back ===========================
                      Padding(
                        padding: const EdgeInsets.only(right: 320),
                        child: WigetBack(
                          onpress: () {
                            GoRouter.of(context).pop();
                          },
                        ),
                      ),
                      SizedBox(height: 250),
                      //================= Text =================================
                      Text(
                        "Create New Password",
                        style: AppStyling.primarytextstyle,
                      ),
                      SizedBox(height: 25),

                      //======================== PassWord ======================
                      CustomTextField(
                        obscureText: ispassword,
                        sufixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispassword = !ispassword;
                            });
                          },
                          icon: Icon(
                            ispassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        hintText: "Password",
                        // controller: _passwordController,
                      ),

                      //================== confirm password ====================
                      CustomTextField(
                        obscureText: iscpassword,
                        sufixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              iscpassword = !iscpassword;
                            });
                          },
                          icon: Icon(
                            iscpassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off_outlined,
                          ),
                        ),
                        hintText: "Confirm Password",

                        // controller: _passwordController,
                      ),
                      SizedBox(height: 20),
                      //======================== Login Button ==================
                      PrimaryPutton(
                        onpress: () {
                          GoRouter.of(
                            context,
                          ).pushNamed(AppRoutes.sucesspassword);
                        },
                        // onpress: () => _registerUser(context),
                        buttontext: "OK",
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
      ),
    );
  }
}

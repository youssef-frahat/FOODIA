import 'package:flutter/material.dart';
import 'package:foodia_app/routing/app_routes.dart';
import 'package:foodia_app/styling/app_assets.dart';
import 'package:foodia_app/styling/app_colors.dart';
import 'package:foodia_app/styling/app_styling.dart';
import 'package:foodia_app/witgets/custom_text_field.dart';
import 'package:foodia_app/witgets/primary_button.dart';
import 'package:foodia_app/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool ispassword = true;
  bool iscpassword = true;

  final formky = GlobalKey<FormState>();
  late TextEditingController namecontroller;
  late TextEditingController phonecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController passcontroller;
  late TextEditingController confirmpasscontroller;

  @override
  void initState() {
    super.initState();
    phonecontroller = TextEditingController();
    namecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passcontroller = TextEditingController();
    confirmpasscontroller = TextEditingController();
  }

  // // Controllers for text fields
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
              child: Form(
                key: formky,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    // ==============Logo===============
                    SizedBox(
                      width: 186,
                      height: 150,
                      child: Image.asset(
                        AppAssets.otpimage,
                        fit: BoxFit.contain,
                      ),
                    ),
                    //=================Text=======================
                    Text("Sign In", style: AppStyling.primarytextstyle),

                    //========================username===============
                    CustomTextField(
                      //================username controller =============
                      controller: namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your username";
                        }
                        return null;
                      },

                      hintText: "Username",
                      sufixicon: Icon(Icons.person),
                      
                    ),
                    //======================== phone ===================
                    CustomTextField(
                      //================== phone controller ======
                      controller: phonecontroller,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter Your Phone";
    
                        if (value.length > 11) return "Please Enter Correct phone";
                        
                      },
                      hintText: "Phone",
                      obscureText: false,
                      sufixicon: Icon(Icons.phone),
                     
                    ),
                    //========================Email====================
                    CustomTextField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your email";
                        }
                        return null;
                      },
                      hintText: "Email",
                      iconfeild: Icons.email,
                      sufixicon: Icon(Icons.email),
                     
                    ),
                    //========================Password===============
                    CustomTextField(
                      controller: passcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your password";
                        }
                        if (value.length < 8) {
                          return "password must at lest 8 character";
                        }
                      },
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
                      
                    ),
                    //========================Confirm Password===============
                    CustomTextField(
                      controller: confirmpasscontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your confirm password";
                        }
                        if (value.length < 8) {
                          return "password must at lest 8 character";
                        }
                      },
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
                      
                    ),
                    //========================Sign UP Button=================
                    Primarybutton(
                      onpress: () {
                        if (formky.currentState!.validate()) {
                          // print(phonecontroller.text);
                          // print(password.text);
                        }
                        GoRouter.of(context).pushNamed(AppRoutes.verifyotp);
                      },
                     
                      buttontext: "Sign Up",
                      fontsize: 23,
                    ),
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

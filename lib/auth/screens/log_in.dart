import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodia_app/auth/screens/sign_in.dart';
import 'package:foodia_app/routing/app_routes.dart';
import 'package:foodia_app/styling/app_assets.dart';
import 'package:foodia_app/styling/app_colors.dart';
import 'package:foodia_app/styling/app_styling.dart';
import 'package:foodia_app/witgets/custom_text_field.dart';
import 'package:foodia_app/witgets/or_witget.dart';
import 'package:foodia_app/witgets/primary_button.dart';
import 'package:foodia_app/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool ispassword = true;
  bool ischeckbox = true;

  final formkey = GlobalKey<FormState>();
  late TextEditingController phonecontroller;
  late TextEditingController password;


  @override
  void initState() {
    super.initState();
    phonecontroller = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ======================= click back ===========================
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
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ==============Logo=======================================
                    SizedBox(
                      width: 186,
                      height: 186,
                      child: Image.asset(AppAssets.logo, fit: BoxFit.contain,),
                    ),
                    //=================Text=====================================
                    Text("Login", style: AppStyling.primarytextstyle),
                    SizedBox(height: 20),
                    //========================phone===============
                    CustomTextField(
                      //=============== controller =============
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Email";
                        }
                        return null;
                      },
                      controller: phonecontroller,
                      //==================================
                      hintText: "Email",
                      obscureText: false,
                      sufixicon: Icon(Icons.email),
                      // controller: _phoneController,
                    ),
                    //========================Password===============
                    CustomTextField(
                      //==============controller=============
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter Your Password";

                        if (value.length < 8) return "password must at lest 8 character";
                        return null;
                      },
                      //===========================
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
                    //=====================forget password ==============
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              activeColor:
                                  AppColors
                                      .primarycolor, 
                              value:
                                  ischeckbox, 
                              onChanged: (value) {
                                setState(() {
                                  ischeckbox =
                                      value ??
                                      false; 
                                });
                              },
                            ),

                            Text(
                              "Remember me",
                              style: TextStyle(
                                
                                fontSize: 17,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.forgetpassword);
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              
                              fontSize: 17,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                   
                    //======================== Login Button=================
                    Primarybutton(
                      onpress: () {
                        if (formkey.currentState!.validate()) {
                          print(phonecontroller.text);
                          print(password.text);
                        }
                      },
                     
                      buttontext: "Login",
                      fontsize: 23,
                    ),
                    SizedBox(height: 20),
                    //=============  oR =========================
                    OrWitget(),
                    SizedBox(height: 20),
                    //================= text Don't have Account ===============
                    RichText(
                      text: TextSpan(
                        text: "Don't have an Account?   ",
                        style: TextStyle(
                         
                          fontSize: 17,
                          color: Colors.deepOrange,
                        ),
                        children: [
                          TextSpan(
                            text: "Register Now",
                            style: TextStyle(
                              
                              fontSize: 19,
                              color: Colors.deepOrange,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignIn(),
                                      ),
                                    );
                                  },
                          ),
                        ],
                      ),
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

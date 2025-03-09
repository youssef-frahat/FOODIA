import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodia_app/Networking/api_endpoint.dart';
import 'package:foodia_app/pages/auth/sign_in.dart';
import 'package:foodia_app/routing/app_routes.dart';
import 'package:foodia_app/styling/app_assets.dart';
import 'package:foodia_app/styling/app_colors.dart';
import 'package:foodia_app/styling/app_styling.dart';
import 'package:foodia_app/witgets/custom_text_field.dart';
import 'package:foodia_app/witgets/or_witget.dart';
import 'package:foodia_app/witgets/primary_putton.dart';
import 'package:foodia_app/witgets/wiget_back.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool ispassword = true;

  final formkey = GlobalKey<FormState>();
  late TextEditingController phonecontroller;
  late TextEditingController password;


  Future<void> Login(String phone, password) async {
    try {
      Response response = await post(
        Uri.parse(ApiEndpoint.baseurl),
        body: {'phone': phone, 'password': password},
      );
      if (response.statusCode == 200) {
        print("Sucssefully Login");
      } else {
        print("Faild");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phonecontroller = TextEditingController();
    password = TextEditingController();
  }

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
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ============back==================
                    Padding(
                      padding: const EdgeInsets.only(right: 320),
                      child: WigetBack(
                        onpress: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                    ),

                    // ==============Logo===============
                    SizedBox(
                      width: 186,
                      height: 186,
                      child: Image.asset(AppAssets.logo, fit: BoxFit.contain),
                    ),
                    //=================Text=======================
                    Text("Login", style: AppStyling.primarytextstyle),
                    SizedBox(height: 25),
                    //========================phone===============
                    CustomTextField(
                      //=============== controller =============
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Phone";
                        }
                        return null;
                      },
                      controller: phonecontroller,
                      //==================================
                      hintText: "Phone",
                      obscureText: false,
                      sufixicon: Icon(Icons.phone),
                      // controller: _phoneController,
                    ),

                    //========================Password===============
                    CustomTextField(
                      //==============controller=============
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        }

                        if (value.length < 8) {
                          return "password must at lest 8 character";
                        }
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
                      // controller: _passwordController,
                    ),
                    //=====================forget password ==============
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Remmber me ",
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: 50),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(
                              context,
                            ).pushNamed(AppRoutes.forgetpassword);
                          },
                          child: Text(
                            "Forget Password ?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    //======================== Login Button=================
                    PrimaryPutton(
                      onpress: () {
                        // if (formkey.currentState!.validate()) {
                        //   print(phonecontroller.text);
                        //   print(password.text);
                        // }
                      },
                      // onpress: () => _registerUser(context),
                      buttontext: "Login",
                      fontsize: 23,
                    ),
                    SizedBox(height: 20),
                    //=============  oR =========================
                    OrWitget(),
                    SizedBox(height: 20),
                    //================= text Don't have Acount ===============
                    RichText(
                      text: TextSpan(
                        text: "Don't have an Account?   ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                        children: [
                          TextSpan(
                            text: "Register Now",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
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

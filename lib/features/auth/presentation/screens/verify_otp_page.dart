// import 'package:flutter/material.dart';
// import 'package:foodia_app/core/routing/app_routes.dart';
// import 'package:foodia_app/core/styling/app_assets.dart';
// import 'package:foodia_app/core/styling/app_colors.dart';
// import 'package:foodia_app/core/styling/app_styling.dart';
// import 'package:foodia_app/core/witgets/primary_button.dart';
// import 'package:foodia_app/core/witgets/wiget_back.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class Verifyotp extends StatefulWidget {
//   const Verifyotp({super.key});

//   @override
//   State<Verifyotp> createState() => _VerifyotpState();
// }

// class _VerifyotpState extends State<Verifyotp> {
//   bool ispassword = true;

//   final formkey = GlobalKey<FormState>();
//   late TextEditingController pincodecontroller;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     pincodecontroller = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ======================= click back =============
//       appBar: AppBar(
//         leading: WigetBack(
//           onpress: () {
//             GoRouter.of(context).pop();
//           },
//         ),
//       ),
//       backgroundColor: AppColors.backgroundcolor,
//       body: Center(
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 30),
//               child: Form(
//                 key: formkey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     // ==============Logo===============
//                     SizedBox(
//                       width: 250,
//                       height: 250,
//                       child: Image.asset(
//                         AppAssets.otpimage,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     //=================Text=======================
//                     Text(
//                       "OTP Verification",
//                       style: AppStyling.primarytextstyle,
//                     ),
//                     SizedBox(height: 25),
//                     // ======================= pin code ===========
//                     Padding(
//                       padding: const EdgeInsets.only(right: 15, left: 15),
//                       child: PinCodeTextField(
//                         textStyle: TextStyle(color: Colors.amber),
//                         appContext: context,
//                         length: 4,
//                         controller: pincodecontroller,
//                         keyboardType: TextInputType.number,
//                         pinTheme: PinTheme(
//                           fieldWidth: 42,
//                           fieldHeight: 42,
//                           shape: PinCodeFieldShape.circle,
//                           selectedColor: AppColors.primarycolor,
//                           inactiveColor: Colors.grey,
//                         ),
//                         onChanged: (value) {
//                           print("pin value : $value");
//                         },
//                         // onCompleted: (value) {
//                         //   GoRouter.of(context).pushNamed(AppRoutes.newpassword);
//                         // },
//                       ),
//                     ),
//                     //========================Password===============
//                     SizedBox(height: 20),
//                     Text(
//                       "Do not send OTP  ?  Send OTP",
//                       style: TextStyle(color: Colors.grey, fontSize: 15),
//                     ),
//                     SizedBox(height: 100),
//                     //======================== Verifyotp Button=================
//                     Primarybutton(
//                       onpress: () {
//                         GoRouter.of(context).pushNamed(AppRoutes.newpassword);
//                         // if (formkey.currentState!.validate()) {
//                         //   print(phonecontroller.text);
//                         //   print(password.text);
//                         // }
//                       },
                      
//                       buttontext: "Submit",
//                       fontsize: 23,
//                     ),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

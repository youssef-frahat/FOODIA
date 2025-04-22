// import 'package:flutter/material.dart';
// import 'package:foodia_app/core/routing/app_routes.dart';
// import 'package:foodia_app/core/styling/app_assets.dart';
// import 'package:foodia_app/core/styling/app_colors.dart';
// import 'package:foodia_app/core/styling/app_fonts.dart';
// import 'package:foodia_app/core/styling/app_styling.dart';
// import 'package:foodia_app/core/witgets/custom_text_field.dart';
// import 'package:foodia_app/core/witgets/primary_button.dart';
// import 'package:foodia_app/core/witgets/wiget_back.dart';
// import 'package:go_router/go_router.dart';

// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ======================= click back ===========================
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
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     SizedBox(height: 30),
//                     //=================Text=====================================
//                     Text("Forget Password", style: AppStyling.primarytextstyle),
//                     // ==============Logo=======================================
//                     SizedBox(
//                       width: 270,
//                       height: 270,
//                       child: Image.asset(
//                         AppAssets.forgetpassimage,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     //=================Text=====================================
//                     Text(
//                       "Enter Your Phone Number ",
//                       style: TextStyle(
//                         fontFamily: AppFonts.mainfontsname,
//                         color: Colors.blueGrey,
//                         fontSize: 25,
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                     //========================phone=============================
//                     CustomTextField(
//                       //=============== controller =============
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Enter Your Phone";
//                         }
//                         return null;
//                       },
//                       hintText: "Phone",
//                       sufixicon: Icon(Icons.phone, color: Colors.blueGrey),
//                     ),
//                     SizedBox(height: 20),
//                     //======================== Login Button =================
//                     Primarybutton(
//                       onpress: () {
//                         GoRouter.of(context).pushNamed(AppRoutes.verifyotp);
//                       },
//                       // onpress: () => _registerUser(context),
//                       buttontext: "Send Code ",
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

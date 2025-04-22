// import 'package:flutter/material.dart';
// import 'package:foodia_app/core/routing/app_routes.dart';
// import 'package:foodia_app/styling/app_assets.dart';

// import 'package:foodia_app/styling/app_colors.dart';

// import 'package:foodia_app/styling/app_styling.dart';
// import 'package:foodia_app/witgets/custom_text_field.dart';
// import 'package:foodia_app/witgets/primary_button.dart';
// import 'package:foodia_app/witgets/wiget_back.dart';
// import 'package:go_router/go_router.dart';

// class NewPass extends StatefulWidget {
//   const NewPass({super.key});

//   @override
//   State<NewPass> createState() => _NewPassState();
// }

// class _NewPassState extends State<NewPass> {
//   bool ispassword = true;
//   bool iscpassword = true;

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
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       SizedBox(height: 65),
//                       //==========================photo ============
//                       SizedBox(
//                         width: 190,
//                         height: 190,
//                         child: Image.asset(
//                           AppAssets.newpass,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       //================= Text =================================
//                       Text(
//                         "Create New Password",
//                         style: AppStyling.primarytextstyle,
//                       ),
//                       SizedBox(height: 15),
//                       //======================== PassWord ======================
//                       CustomTextField(
//                         obscureText: ispassword,
//                         sufixicon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               ispassword = !ispassword;
//                             });
//                           },
//                           icon: Icon(
//                             ispassword
//                                 ? Icons.remove_red_eye_outlined
//                                 : Icons.visibility_off_outlined,
//                           ),
//                         ),
//                         hintText: "Password",
                        
//                       ),
//                       SizedBox(height: 15),
//                       //================== confirm password ====================
//                       CustomTextField(
//                         obscureText: iscpassword,
//                         sufixicon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               iscpassword = !iscpassword;
//                             });
//                           },
//                           icon: Icon(
//                             iscpassword
//                                 ? Icons.remove_red_eye_outlined
//                                 : Icons.visibility_off_outlined,
//                           ),
//                         ),
//                         hintText: "Confirm Password",

                        
//                       ),
//                       SizedBox(height: 20),
//                       //======================== Login Button ==================
//                       Primarybutton(
//                         onpress: () {
//                           GoRouter.of(
//                             context,
//                           ).pushNamed(AppRoutes.sucesspassword);
//                         },
                        
//                         buttontext: "OK",
//                         fontsize: 28,
//                       ),
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
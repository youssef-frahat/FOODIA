import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodia_app/core/styling/app_assets.dart';

import '../widget/home_view_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      actions: [
        IconButton(
          icon:  SvgPicture.asset(AppAssets.cartSvg),
          onPressed: () {
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none_outlined,color: Colors.black,),
          onPressed: () {
            // Handle notification button press
          },
        ),
      ],
      ),
      body: HomeViewBody(),
    );
  }
}
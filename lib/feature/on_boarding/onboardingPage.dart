import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodia_app/feature/on_boarding/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Step 15: Add the onboarding image
        SvgPicture.asset(item.image, height: 300),
        SizedBox(height: 20),
        // Step 17: Add the onboarding title
        Text(
          item.title.data as String,
          style: item.textStyle, // Step 18: Customize the text style
        ),
        SizedBox(height: 10),
        // Step 19: Add the onboarding description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            item.description.data as String,
            textAlign: TextAlign.center,
            style: item.disStyle, // Step 20: Customize the text style
          ),
        ),
      ],
    );
  }
}

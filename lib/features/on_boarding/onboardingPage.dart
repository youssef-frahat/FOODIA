import 'package:flutter/material.dart';
import 'package:foodia_app/features/on_boarding/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Step 15: Add the onboarding image
        SizedBox(
          height: 304,
          width: 262,
          child: Image.asset(item.image, fit: BoxFit.contain),
        ),
        SizedBox(height: 20),
        // Step 17: Add the onboarding title
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              textAlign: TextAlign.center,
              item.title.data as String,
              style: item.textStyle, // Step 18: Customize the text style
            ),
          ),
        ),
        SizedBox(height: 10),
        // Step 19: Add the onboarding description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
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

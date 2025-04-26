import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_config/app_strings.dart';
import '../../../../../core/app_config/font_styles.dart';
import '../../../../../core/routing/app_routes.dart';

class RememberMeRow extends StatefulWidget {
  final ValueChanged<bool> onRememberChanged;

  const RememberMeRow({super.key, required this.onRememberChanged});

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool isRememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.pushNamed(AppRoutes.forgetpassword);
          },
          child: Text(AppStrings.forgotPassword, style: FontStyles.body15W400),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: isRememberMe,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value ?? true;
                });
                widget.onRememberChanged(isRememberMe);
              },
              activeColor: Colors.black,
              checkColor: Colors.white,
            ),
            Text(
              AppStrings.rememberMe,
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 14,

                color: Color(0xFFEA834B),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

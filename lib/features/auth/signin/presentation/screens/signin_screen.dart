import 'package:flutter/material.dart';

import '../widget/signin_body_widget.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SigninBodyWidget());
  }
}

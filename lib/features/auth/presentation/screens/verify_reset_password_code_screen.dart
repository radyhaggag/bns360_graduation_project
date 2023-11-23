import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/verify_reset_password_code/verify_reset_password_code_body.dart';

class VerifyResetPasswordCodeScreen extends StatelessWidget {
  final String email;
  const VerifyResetPasswordCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CupertinoNavigationBarBackButton(),
      ),
      body: SafeArea(
        child: VerifyResetPasswordCodeBody(email: email),
      ),
    );
  }
}

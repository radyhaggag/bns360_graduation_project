import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_button.dart';
import '../widgets/verify_reset_password_code/verify_reset_password_code_body.dart';

class VerifyResetPasswordCodeScreen extends StatelessWidget {
  final String email;
  const VerifyResetPasswordCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SafeArea(
        child: VerifyResetPasswordCodeBody(email: email),
      ),
    );
  }
}

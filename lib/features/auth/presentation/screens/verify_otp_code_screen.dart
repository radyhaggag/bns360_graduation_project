import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_back_button.dart';
import '../widgets/verify_otp_code/verify_otp_code_body.dart';

class VerifyResetPasswordCodeScreen extends StatelessWidget {
  final String email;
  const VerifyResetPasswordCodeScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: VerifyOtpCodeBody(email: email),
    );
  }
}

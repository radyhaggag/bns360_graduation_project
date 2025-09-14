import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/custom_toast.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/verify_otp_code/verify_otp_code_body.dart';

class VerifyResetPasswordCodeScreen extends StatelessWidget {
  final String email;
  const VerifyResetPasswordCodeScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Colors.transparent,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            showToast(
              // state.message,
              S.of(context).invalid_otp_code_msg,
              ToastType.error,
            );
          }
          if (state is VerifyResetPasswordCodeSuccessState) {
            Navigator.of(context).popAndPushNamed(
              Routes.resetPassword,
              arguments: email,
            );
          }
          if (state is SendResetPasswordCodeSuccessState) {
            showToast(
              S.of(context).check_your_email_for_verification_code,
              ToastType.success,
            );
          }
        },
        child: VerifyOtpCodeBody(email: email),
      ),
    );
  }
}

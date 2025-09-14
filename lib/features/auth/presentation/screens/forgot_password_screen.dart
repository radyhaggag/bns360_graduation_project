import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/custom_toast.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../../../../generated/l10n.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/forgot_password/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
              state.message,
              ToastType.error,
            );
          }
          if (state is SendResetPasswordCodeSuccessState) {
            showToast(
              S.of(context).check_your_email_for_verification_code,
              ToastType.success,
            );

            Navigator.of(context).pushNamed(
              Routes.verifyOtpCode,
              arguments: state.email,
            );
          }
        },
        child: const ForgotPasswordBody(),
      ),
    );
  }
}

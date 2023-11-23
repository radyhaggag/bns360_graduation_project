import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/forgot_password/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CupertinoNavigationBarBackButton(),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            // showToast(state.message, ToastType.error);
            // CommonDialogs.showErrorDialog(context, message: state.message);
            Navigator.of(context).pushNamed(
              Routes.verifyResetPasswordCode,
              arguments: "radyhaggag@gmail.com",
            );
          }
          if (state is SendResetPasswordCodeSuccessState) {
            // TODO: REDIRECT USER TO VERIFY RESET PASSWORD CODE SCREEN
            Navigator.of(context).pushNamed(
              Routes.verifyResetPasswordCode,
              arguments: state.email,
            );
          }
        },
        child: const SafeArea(
          child: ForgotPasswordBody(),
        ),
      ),
    );
  }
}

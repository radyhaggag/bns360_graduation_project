import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/core/helpers/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            showToast(state.message, ToastType.error);
          }
          if (state is LoginSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home,
              (route) => false,
            );
          }
          if (state is SignUpSuccessState || state is VerifyEmailSuccessState) {
            Navigator.of(context).popAndPushNamed(
              Routes.login,
            );
          }
        },
        child: const SafeArea(
          child: LoginBody(),
        ),
      ),
    );
  }
}

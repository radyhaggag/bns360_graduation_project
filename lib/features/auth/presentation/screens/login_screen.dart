import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/common_dialogs.dart';
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
            // showToast(state.message, ToastType.error);
            CommonDialogs.showErrorDialog(context, message: state.message);
          }
          if (state is LoginSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home,
              (route) => false,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/common_dialogs.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/sign_up/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ErrorState) {
            // showToast(state.message, ToastType.error);
            CommonDialogs.showErrorDialog(context, message: state.message);
          }
          if (state is SignUpSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.login,
              (route) => false,
            );
          }
        },
        child: const SignUpBody(),
      ),
    );
  }
}

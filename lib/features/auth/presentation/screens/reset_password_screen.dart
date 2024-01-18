import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/widgets/custom_back_button.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/reset_password/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;

  const ResetPasswordScreen({super.key, required this.email});

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
            // showToast(state.message, ToastType.error);
            // CommonDialogs.showErrorDialog(context, message: state.message);
            // TODO: REMOVE THIS NAVIGATION
            Navigator.of(context).popAndPushNamed(
              Routes.passwordChanged,
            );
          }
          if (state is ResetPasswordSuccessState) {
            // TODO: REDIRECT USER TO SUCCESS SCREEN
            Navigator.of(context).popAndPushNamed(
              Routes.passwordChanged,
            );
          }
        },
        child: ResetPasswordBody(email: email),
      ),
    );
  }
}

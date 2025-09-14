import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/route_config.dart';
import '../../../../core/helpers/common_dialogs.dart';
import '../../../../core/helpers/custom_toast.dart';
import '../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
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
            if (state.message.contains("Email not confirmed")) {
              CommonDialogs.showErrorDialog(
                context,
                message: state.message,
                customWidget: _SentEmailVerificationBtn(
                  email: state.email!,
                  authBloc: context.read<AuthBloc>(),
                ),
              );
            } else {
              showToast(
                state.message,
                ToastType.error,
              );
            }
          }
          if (state is LoginSuccessState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.bottomNavBar,
              (route) => false,
            );
            context.read<ProfileBloc>().add(const GetProfileEvent());
          }
          if (state is SendConfirmationEmailSuccessState) {
            Navigator.pop(context);
            CommonDialogs.showSuccessDialog(
              context,
              message: S.of(context).sent_email_verification_link,
            );
          }
        },
        child: const LoginBody(),
      ),
    );
  }
}

class _SentEmailVerificationBtn extends StatelessWidget {
  const _SentEmailVerificationBtn({
    required this.email,
    required this.authBloc,
  });

  final String email;
  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authBloc,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return CustomElevatedButton(
            isLoading: state is SendConfirmationEmailLoadingState,
            isDisabled: state is SendConfirmationEmailLoadingState,
            label: S.of(context).resend_email_verification,
            onPressed: () {
              context.read<AuthBloc>().add(
                    SendConfirmationEmailEvent(
                      email: email,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}

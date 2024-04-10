import 'package:bns360_graduation_project/config/route_config.dart';
import 'package:bns360_graduation_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';

class ContinueAsGuestButton extends StatelessWidget {
  const ContinueAsGuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomTextButton(
          isLoading: state is LoginLoadingState,
          onPressed: () async {
            context.read<AuthBloc>().add(ContinueAsGuestEvent());
          },
          label: S.of(context).continueAsGuest,
        );
      },
      listener: (BuildContext context, AuthState state) {
        if (state is LoginSuccessState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.bottomNavBar,
            (route) => false,
          );
        }
      },
    );
  }
}

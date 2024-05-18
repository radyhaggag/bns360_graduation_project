import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

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

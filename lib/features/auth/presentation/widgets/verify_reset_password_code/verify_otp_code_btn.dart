import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/buttons/custom_loading_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class VerifyOtpCodeBtn extends StatelessWidget {
  final void Function()? onPressed;
  const VerifyOtpCodeBtn({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomElevatedButtonWithLoading(
          onPressed: onPressed,
          label: S.of(context).verify,
          isLoading: state is VerifyResetPasswordCodeLoadingState,
        );
      },
    );
  }
}

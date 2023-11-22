import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class SendCodeBtn extends StatelessWidget {
  final void Function()? onPressed;
  const SendCodeBtn({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is SendResetPasswordCodeLoadingState) {
          return const CenterProgressIndicator();
        }
        return CustomElevatedButton(
          onPressed: onPressed,
          label: S.of(context).sendCode,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class SignUpBtn extends StatelessWidget {
  final void Function()? onPressed;
  const SignUpBtn({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is SignUpLoadingState) {
          return const CenterProgressIndicator();
        }
        return CustomElevatedButton(
          onPressed: onPressed,
          label: S.of(context).signUp,
        );
      },
    );
  }
}

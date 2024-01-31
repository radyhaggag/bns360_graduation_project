import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class LoginBtn extends StatelessWidget {
  final void Function()? onPressed;
  const LoginBtn({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return CustomElevatedButton(
          onPressed: onPressed,
          label: S.of(context).login,
          isLoading: state is LoginLoadingState,
        );
      },
    );
  }
}

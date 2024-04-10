import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ReactiveFormConsumer(builder: (context, form, child) {
          return CustomElevatedButton(
            onPressed: form.valid
                ? () {
                    final formControls = form.controls;

                    final email = formControls['email']!.value as String;
                    final password = formControls['password']!.value as String;

                    context.read<AuthBloc>().add(LoginEvent(
                          email: email,
                          password: password,
                        ));
                  }
                : null,
            label: S.of(context).login,
            isLoading: state is LoginLoadingState,
          );
        });
      },
    );
  }
}

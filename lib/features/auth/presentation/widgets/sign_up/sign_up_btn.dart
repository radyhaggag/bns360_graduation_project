import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ReactiveFormConsumer(
          builder: (context, form, child) {
            return CustomElevatedButton(
              onPressed: form.valid &&context.read<AuthBloc>().userType != null
                  ? () {
                      final formControls = form.controls;

                      final name = formControls['name']!.value as String;
                      final email = formControls['email']!.value as String;
                      final password =
                          formControls['password']!.value as String;

                      context.read<AuthBloc>().add(SignUpEvent(
                            name: name,
                            email: email,
                            password: password,
                          ));
                    }
                  : null,
              label: S.of(context).signUp,
              isLoading: state is SignUpLoadingState,
            );
          },
        );
      },
    );
  }
}

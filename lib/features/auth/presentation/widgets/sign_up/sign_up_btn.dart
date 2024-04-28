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
    final bloc = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ReactiveFormConsumer(
          builder: (context, form, child) {
            return CustomElevatedButton(
              isDisabled: !(form.valid && bloc.userType != null),
              onPressed: () {
                final formControls = form.controls;

                final name = formControls['name']!.value as String;
                final email = formControls['email']!.value as String;
                final password = formControls['password']!.value as String;

                bloc.add(SignUpEvent(
                  name: name,
                  email: email,
                  password: password,
                ));
              },
              label: S.of(context).signUp,
              isLoading: state is SignUpLoadingState,
            );
          },
        );
      },
    );
  }
}

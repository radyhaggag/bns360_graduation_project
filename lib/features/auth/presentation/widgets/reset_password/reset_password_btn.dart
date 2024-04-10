import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';

class ResetPasswordBtn extends StatelessWidget {
  const ResetPasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Builder(
          builder: (context) {
            return ReactiveFormConsumer(builder: (context, form, child) {
              return CustomElevatedButton(
                onPressed: form.valid
                    ? () {
                        final formControls = form.controls;

                        final email = formControls['email']!.value as String;
                        final newPassword =
                            formControls['password']!.value as String;

                        context.read<AuthBloc>().add(ResetPasswordEvent(
                              email: email,
                              newPassword: newPassword,
                            ));
                      }
                    : null,
                label: S.of(context).resetPassword,
                isLoading: state is ResetPasswordLoadingState,
              );
            });
          },
        );
      },
    );
  }
}

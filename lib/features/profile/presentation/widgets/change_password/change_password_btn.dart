import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/buttons/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/profile_bloc.dart';

class ChangePasswordBtn extends StatelessWidget {
  const ChangePasswordBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Builder(
          builder: (context) {
            return ReactiveFormConsumer(builder: (context, form, child) {
              return CustomElevatedButton(
                isDisabled: !form.valid,
                onPressed: () {
                  final formControls = form.controls;

                  final oldPassword =
                      formControls['oldPassword']!.value as String;
                  final newPassword =
                      formControls['newPassword']!.value as String;

                  context.read<ProfileBloc>().add(ChangePasswordEvent(
                        oldPassword: oldPassword,
                        newPassword: newPassword,
                      ));
                },
                label: S.of(context).change_password,
                isLoading: state is ChangePasswordLoadingState,
              );
            });
          },
        );
      },
    );
  }
}

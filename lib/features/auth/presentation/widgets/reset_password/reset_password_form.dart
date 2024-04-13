import 'package:bns360_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/input_fields/password_input_field.dart';
import '../../../../../generated/l10n.dart';
import 'reset_password_btn.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;
  const ResetPasswordForm({super.key, required this.email});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup(
      {
        'password': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(kMinPasswordLength)
          ],
        ),
        'confirmPassword': FormControl<String>(),
      },
      validators: [
        Validators.mustMatch('password', 'confirmPassword'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => form,
      builder: (context, formGroup, child) => child!,
      child: Column(
        children: [
          PasswordInputField(
            title: S.of(context).newPassword,
            hint: S.of(context).enterNewPassword,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          ConfirmPasswordInputField(
            formGroup: form,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 50),
          const ResetPasswordBtn(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}

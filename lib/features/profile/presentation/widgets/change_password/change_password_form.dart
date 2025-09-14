import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/input_fields/password_input_field.dart';
import '../../../../../generated/l10n.dart';
import 'change_password_btn.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup(
      {
        'oldPassword': FormControl<String>(
          validators: [
            Validators.required,
          ],
        ),
        'newPassword': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(kMinPasswordLength),
            Validators.pattern(r'[A-Z]'),
            Validators.pattern(r'[a-z]'),
            Validators.pattern(r'\d'),
            Validators.pattern(r'[!@#$%^&*(),.?":{}|<>]'),
          ],
        ),
      },
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
            title: S.of(context).oldPassword,
            hint: S.of(context).enterOldPassword,
            controlName: 'oldPassword',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          PasswordInputField(
            title: S.of(context).newPassword,
            hint: S.of(context).enterNewPassword,
            controlName: 'newPassword',
            // showRequirements: true,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 50),
          const ChangePasswordBtn(),
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

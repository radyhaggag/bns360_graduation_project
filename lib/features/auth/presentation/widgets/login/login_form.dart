import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/input_fields/email_input_field.dart';
import '../../../../../core/widgets/input_fields/password_input_field.dart';
import 'forgot_password_btn.dart';
import 'login_btn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(kMinPasswordLength)
        ],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => form,
      builder: (context, formGroup, child) => child!,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailInputField(
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 15),
          PasswordInputField(
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 5),
          ForgotPasswordBtn(),
          SizedBox(height: 50),
          LoginBtn(),
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

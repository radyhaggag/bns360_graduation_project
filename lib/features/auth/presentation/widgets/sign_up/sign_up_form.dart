import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/input_fields/email_input_field.dart';
import '../../../../../core/widgets/input_fields/name_input_field.dart';
import '../../../../../core/widgets/input_fields/password_input_field.dart';
import 'sign_up_btn.dart';
import 'user_type_dropdown.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
          Validators.minLength(kMinPasswordLength),
          // Validators.pattern(r'[A-Z]'),
          // Validators.pattern(r'[a-z]'),
          // Validators.pattern(r'\d'),
          // Validators.pattern(r'[!@#$%^&*(),.?":{}|<>]'),
        ],
      ),
      'name': FormControl<String>(
        validators: [Validators.required],
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
          NameInputField(
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 15),
          EmailInputField(
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 15),
          PasswordInputField(
            textInputAction: TextInputAction.done,
            // showRequirements: true,
          ),
          SizedBox(height: 15),
          UserTypeDropdown(),
          SizedBox(height: 15),
          SignUpBtn(),
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

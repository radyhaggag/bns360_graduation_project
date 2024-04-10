import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../core/widgets/input_fields/email_input_field.dart';
import 'send_code_btn.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late final FormGroup form;

  @override
  void initState() {
    super.initState();
    form = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => form,
      builder: (context, formGroup, child) => child!,
      child: const Column(
        children: [
          EmailInputField(
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: 40),
          SendCodeBtn(),
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

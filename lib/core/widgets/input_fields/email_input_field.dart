import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../helpers/form_validators.dart';
import 'custom_input_field.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? initialValue;

  const EmailInputField({
    super.key,
    required this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      title: S.of(context).email,
      hint: S.of(context).enterEmail,
      initialValue: initialValue,
      validator: (value) => FormValidator.validateEmail(value),
    );
  }
}

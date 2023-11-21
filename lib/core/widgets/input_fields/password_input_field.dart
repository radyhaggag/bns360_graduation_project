import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../helpers/form_validators.dart';
import 'custom_input_field.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? initialValue;

  const PasswordInputField({
    super.key,
    required this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      title: S.of(context).password,
      hint: S.of(context).enterPassword,
      initialValue: initialValue,
      isSecure: true,
      validator: (value) => FormValidator.validatePassword(value),
    );
  }
}

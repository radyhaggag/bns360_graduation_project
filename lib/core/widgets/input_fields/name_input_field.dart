import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../helpers/form_validators.dart';
import 'custom_input_field.dart';

class NameInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? initialValue;

  const NameInputField({
    super.key,
    required this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: controller,
      keyboardType: TextInputType.name,
      title: S.of(context).fullName,
      hint: S.of(context).enterName,
      initialValue: initialValue,
      validator: (value) => FormValidator.validateName(value),
    );
  }
}

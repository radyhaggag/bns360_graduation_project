import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../helpers/form_validators.dart';
import 'custom_input_field.dart';

class NameInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;

  const NameInputField({
    super.key,
    required this.controller,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: controller,
      keyboardType: TextInputType.name,
      title: label ?? S.of(context).fullName,
      hint: label ?? S.of(context).enterName,
      validator: (value) => FormValidator.validateName(value),
      label: label,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../helpers/form_validators.dart';
import 'custom_reactive_input_field.dart';

class NameInputField extends StatelessWidget {
  final String? label;
  final TextInputAction? textInputAction;

  const NameInputField({
    super.key,
    this.label,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return CustomReactiveFormField(
      formControlName: 'name',
      keyboardType: TextInputType.name,
      title: label ?? S.of(context).fullName,
      hint: label ?? S.of(context).enterName,
      validator: (value) => FormValidator.validateName(value),
      label: label,
      textInputAction: textInputAction,
    );
  }
}

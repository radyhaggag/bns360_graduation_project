import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../helpers/form_validators.dart';
import 'custom_reactive_input_field.dart';

class EmailInputField extends StatelessWidget {
  final TextInputAction? textInputAction;
  const EmailInputField({
    super.key,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return CustomReactiveFormField(
      keyboardType: TextInputType.emailAddress,
      title: S.of(context).email,
      hint: S.of(context).enterEmail,
      validator: (value) => FormValidator.validateEmail(value),
      formControlName: 'email',
      textInputAction: textInputAction,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../generated/l10n.dart';
import 'custom_reactive_input_field.dart';

class PasswordInputField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextInputAction? textInputAction;

  const PasswordInputField({
    super.key,
    this.title,
    this.hint,
    this.textInputAction,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return SharedPasswordInputField(
      title: widget.title ?? S.of(context).password,
      hint: widget.hint ?? S.of(context).enterPassword,
      formControlName: 'password',
    );
  }
}

class ConfirmPasswordInputField extends StatefulWidget {
  final FormGroup formGroup;
  final TextInputAction? textInputAction;

  const ConfirmPasswordInputField({
    super.key,
    required this.formGroup,
    this.textInputAction,
  });

  @override
  State<ConfirmPasswordInputField> createState() =>
      _ConfirmPasswordInputFieldState();
}

class _ConfirmPasswordInputFieldState extends State<ConfirmPasswordInputField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return SharedPasswordInputField(
      title: S.of(context).confirmNewPassword,
      hint: S.of(context).confirmNewPassword,
      validator: (value) => _validateConfirmationPassword(value),
      formControlName: 'confirmPassword',
    );
  }

  String? _validateConfirmationPassword(String? value) {
    final formControls = widget.formGroup.controls;

    final password = formControls['title']!.value as String;

    if (value != password) {
      return S.of(context).passwordsDoNotMatch;
    }
    return null;
  }
}

class SharedPasswordInputField extends StatefulWidget {
  final String title;
  final String hint;
  final String? Function(String?)? validator;
  final String formControlName;
  final TextInputAction? textInputAction;

  const SharedPasswordInputField({
    super.key,
    required this.title,
    required this.hint,
    this.validator,
    required this.formControlName,
    this.textInputAction,
  });

  @override
  State<SharedPasswordInputField> createState() =>
      _SharedPasswordInputFieldState();
}

class _SharedPasswordInputFieldState extends State<SharedPasswordInputField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return CustomReactiveFormField(
      formControlName: widget.formControlName,
      keyboardType: TextInputType.visiblePassword,
      title: widget.title,
      hint: widget.hint,
      isSecure: isSecure,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      suffixIcon: InkWell(
        onTap: () => setState(() => isSecure = !isSecure),
        child: _getSuffixIcon(),
      ),
    );
  }

  Widget _getSuffixIcon() => isSecure
      ? const Icon(Icons.remove_red_eye)
      : const Icon(Icons.remove_red_eye_outlined);
}

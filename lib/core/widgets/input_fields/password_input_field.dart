import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../helpers/form_validators.dart';
import '../../utils/app_colors.dart';
import 'custom_input_field.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;

  const PasswordInputField({
    Key? key,
    required this.controller,
    this.title,
    this.hint,
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return SharedPasswordInputField(
      controller: widget.controller,
      title: widget.title ?? S.of(context).password,
      hint: widget.hint ?? S.of(context).enterPassword,
    );
  }
}

class ConfirmPasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;

  const ConfirmPasswordInputField({
    Key? key,
    required this.controller,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<ConfirmPasswordInputField> createState() =>
      _ConfirmPasswordInputFieldState();
}

class _ConfirmPasswordInputFieldState extends State<ConfirmPasswordInputField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return SharedPasswordInputField(
      controller: widget.controller,
      title: S.of(context).confirmNewPassword,
      hint: S.of(context).confirmNewPassword,
      validator: (value) => _validateConfirmationPassword(value),
    );
  }

  String? _validateConfirmationPassword(String? value) {
    if (value != widget.passwordController.text) {
      return S.of(context).passwordsDoNotMatch;
    }
    return FormValidator.validatePassword(value);
  }
}

class SharedPasswordInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final String? Function(String?)? validator; // Added validator parameter

  const SharedPasswordInputField({
    Key? key,
    required this.controller,
    required this.title,
    required this.hint,
    this.validator,
  }) : super(key: key);

  @override
  State<SharedPasswordInputField> createState() =>
      _SharedPasswordInputFieldState();
}

class _SharedPasswordInputFieldState extends State<SharedPasswordInputField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return CustomInputField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      title: widget.title,
      hint: widget.hint,
      isSecure: isSecure,
      validator: widget.validator,
      suffixIcon: InkWell(
        onTap: () => setState(() => isSecure = !isSecure),
        child: _getSuffixIcon(),
      ),
    );
  }

  Widget _getSuffixIcon() => isSecure
      ? Icon(
          Icons.remove_red_eye,
          color: AppColors.black25,
        )
      : Icon(
          Icons.remove_red_eye_outlined,
          color: AppColors.black25,
        );
}

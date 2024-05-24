import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../generated/l10n.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/extensions/context.dart';
import 'custom_reactive_input_field.dart';

class PasswordInputField extends StatefulWidget {
  final String? title;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool showRequirements;
  final String controlName;

  const PasswordInputField({
    super.key,
    this.title,
    this.hint,
    this.textInputAction,
    this.controlName = 'password',
    this.showRequirements = false,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isSecure = true;

  List<String> get passwordRequirements => [
        S.of(context).password_requirements_length,
        S.of(context).password_requirements_uppercase,
        S.of(context).password_requirements_lowercase,
        S.of(context).password_requirements_digit,
        S.of(context).password_requirements_special_character,
      ];

  List<bool> isRequirementValid(String password) => [
        password.length >= 9,
        RegExp(r'[A-Z]').hasMatch(password),
        RegExp(r'[a-z]').hasMatch(password),
        RegExp(r'\d').hasMatch(password),
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password),
      ];

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(builder: (context, form, child) {
      final password = (form.findControl(widget.controlName)?.value ?? "") as String;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedPasswordInputField(
            title: widget.title ?? S.of(context).password,
            hint: widget.hint ?? S.of(context).enterPassword,
            formControlName: widget.controlName,
            textInputAction: widget.textInputAction,
            viewValidatorError: !widget.showRequirements,
          ),
          if (widget.showRequirements) ...[
            Text(
              S.of(context).password_must_contain,
              style: context.textTheme.titleSmall?.copyWith(
                fontSize: AppFontSize.details,
              ),
            ),
            for (int i = 0; i < passwordRequirements.length; i++)
              Row(
                children: [
                  if (isRequirementValid(password)[i])
                    Icon(
                      Icons.check,
                      color: AppColors.green,
                      size: 15.r,
                    )
                  else
                    const SizedBox.shrink(),
                  Text(
                    "${isRequirementValid(password)[i] ? "" : "\t-"} ${passwordRequirements[i]}",
                    style: context.textTheme.bodySmall?.copyWith(
                      fontSize: AppFontSize.details,
                    ),
                  ),
                ],
              ),
          ],
        ],
      );
    });
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
      formControlName: 'confirmPassword',
      textInputAction: widget.textInputAction,
    );
  }
}

class SharedPasswordInputField extends StatefulWidget {
  final String title;
  final String hint;
  final String formControlName;
  final TextInputAction? textInputAction;
  final bool viewValidatorError;

  const SharedPasswordInputField({
    super.key,
    required this.title,
    required this.hint,
    required this.formControlName,
    this.textInputAction,
    this.viewValidatorError = true,
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
      textInputAction: widget.textInputAction,
      suffixIcon: InkWell(
        onTap: () => setState(() => isSecure = !isSecure),
        child: _getSuffixIcon(),
      ),
      showValidationMessages: widget.viewValidatorError,
    );
  }

  Widget _getSuffixIcon() => isSecure
      ? const Icon(Icons.remove_red_eye)
      : const Icon(Icons.remove_red_eye_outlined);
}

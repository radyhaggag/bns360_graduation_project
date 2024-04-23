import 'package:bns360_graduation_project/core/helpers/validators/form_validators.dart';
import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

typedef ValidationMessages = Map<String, String Function(Object)>?;

class CustomReactiveFormField extends StatelessWidget {
  final String? title;
  final String? label;
  final String? hint;
  final String? prefixText;
  final String? Function(String?)? validator;
  final bool isSecure;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final double? fontSize;
  final double? heightBetweenLabelAndField;
  final InputDecoration? inputDecoration;
  final TextStyle? textStyle;
  final int? maxLines;
  final int? maxLength;
  final Widget? separatorWidget;
  final bool isHorizontally;
  final double? textFieldWidth;
  final double? textFieldHeight;
  final bool isDigitsOnly;
  final double? fromStartMargin;
  final TextAlign? textAlign;
  final String formControlName;
  final TextInputAction? textInputAction;
  final ValidationMessages? validationMessages;
  final bool isExpanded;
  const CustomReactiveFormField({
    super.key,
    this.label,
    this.hint,
    this.validator,
    this.title,
    this.prefixText,
    this.isSecure = false,
    this.keyboardType,
    this.suffixIcon,
    this.fontSize,
    this.heightBetweenLabelAndField,
    this.inputDecoration,
    this.textStyle,
    this.maxLines,
    this.isHorizontally = false,
    this.separatorWidget,
    this.textFieldWidth,
    this.isDigitsOnly = false,
    this.fromStartMargin,
    this.textAlign,
    this.textFieldHeight,
    this.maxLength,
    required this.formControlName,
    this.textInputAction,
    this.validationMessages,
    this.isExpanded = true,
  });

  Widget get reactiveField {
    return _BuildTextField(
      formControlName: formControlName,
      inputDecoration: inputDecoration,
      keyboardType: keyboardType,
      isSecure: isSecure,
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      textStyle: textStyle,
      maxLength: maxLength,
      hint: hint,
      isDigitsOnly: isDigitsOnly,
      label: label,
      prefixText: prefixText,
      suffixIcon: suffixIcon,
      title: title,
      textInputAction: textInputAction,
      validationMessages: validationMessages,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return reactiveField;
    } else if (isHorizontally) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title!,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.theme.cardColor,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
          if (separatorWidget != null) separatorWidget!,
          if (textFieldWidth != null)
            Container(
              width: textFieldWidth,
              height: textFieldHeight,
              margin: EdgeInsetsDirectional.only(start: fromStartMargin ?? 0),
              child: reactiveField,
            )
          else if (isExpanded)
            Expanded(
              child: reactiveField,
            )
          else
            reactiveField,
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title!,
                style: context.textTheme.titleSmall?.copyWith(
                  color: context.theme.cardColor,
                  fontSize: fontSize,
                ),
              ),
            ),
            SizedBox(height: heightBetweenLabelAndField ?? 5),
          ],
          reactiveField,
        ],
      );
    }
  }
}

class _BuildTextField extends StatefulWidget {
  const _BuildTextField({
    this.isSecure = false,
    this.keyboardType,
    this.textStyle,
    this.maxLines,
    this.maxLength,
    this.inputDecoration,
    this.hint,
    this.title,
    this.label,
    this.prefixText,
    this.suffixIcon,
    this.isDigitsOnly = false,
    required this.formControlName,
    this.textAlign,
    this.textInputAction,
    this.validationMessages,
  });

  final bool isSecure;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final int? maxLines;
  final InputDecoration? inputDecoration;
  final String? hint;
  final String? title;
  final String? label;
  final String? prefixText;
  final Widget? suffixIcon;
  final bool isDigitsOnly;
  final TextAlign? textAlign;
  final int? maxLength;
  final String formControlName;
  final TextInputAction? textInputAction;
  final ValidationMessages? validationMessages;

  @override
  State<_BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<_BuildTextField> {
  String? hintText;
  String? prefixText;

  @override
  void initState() {
    super.initState();
    hintText = widget.hint;
    prefixText = widget.prefixText;
    if (hintText != null) {
      prefixText = null;
    }
  }

  InputDecoration get defaultInputDecoration => InputDecoration(
        hintText: hintText,
        labelText: widget.title != null ? null : widget.label,
        prefixText: prefixText,
        suffixIcon: widget.suffixIcon,
        alignLabelWithHint: true,
        counter: const SizedBox.shrink(),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      );

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: widget.formControlName,
      decoration: widget.inputDecoration ?? defaultInputDecoration,
      keyboardType: widget.keyboardType,
      obscureText: widget.isSecure,
      maxLines: widget.isSecure ? 1 : widget.maxLines,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign ?? TextAlign.start,
      textInputAction: widget.textInputAction,
      style: widget.textStyle,
      onTap: (control) {
        if (((control.value as String?) ?? "").isEmpty &&
                widget.prefixText != null ||
            widget.hint != null) {
          if (prefixText == null) {
            prefixText = widget.prefixText;
            hintText = null;

            setState(() {});
          }
        }
      },
      validationMessages: widget.validationMessages ??
          FormValidator.validationMessages(context),
      inputFormatters: widget.isDigitsOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
    );
  }
}

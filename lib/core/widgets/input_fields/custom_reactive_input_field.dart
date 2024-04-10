import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveFormField extends StatelessWidget {
  final String? title;
  final String? label;
  final String? hint;
  final String? prefixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
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

  const CustomReactiveFormField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.title,
    this.prefixText,
    this.initialValue,
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
      controller: controller,
      maxLength: maxLength,
      hint: hint,
      initialValue: initialValue,
      isDigitsOnly: isDigitsOnly,
      label: label,
      prefixText: prefixText,
      suffixIcon: suffixIcon,
      title: title,
      textInputAction: textInputAction,
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
          else
            Expanded(
              child: reactiveField,
            ),
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
    this.controller,
    this.initialValue,
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
  });

  final TextEditingController? controller;
  final String? initialValue;
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
    widget.controller?.addListener(() {
      String textValue = widget.controller?.text ?? "";
      if (textValue.isNotEmpty && widget.prefixText != null) {
        if (prefixText == null) {
          prefixText = widget.prefixText;
          hintText = null;
          setState(() {});
        }
      }
    });
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
      maxLines: widget.isSecure ? 1: widget.maxLines,
      maxLength: widget.maxLength,
      textAlign: widget.textAlign ?? TextAlign.start,
      textInputAction: widget.textInputAction,
      style: widget.textStyle,
      onTap: (_) {
        String textValue = widget.controller?.text ?? "";
        if (textValue.isEmpty && widget.prefixText != null) {
          if (prefixText == null) {
            prefixText = widget.prefixText;
            hintText = null;

            setState(() {});
          }
        }
      },
      inputFormatters: widget.isDigitsOnly
          ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
          : null,
    );
  }
}

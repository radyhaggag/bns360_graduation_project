import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
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

  const CustomInputField({
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
  });

  @override
  Widget build(BuildContext context) {
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
        TextFormField(
          controller: controller,
          validator: validator,
          initialValue: initialValue,
          obscureText: isSecure,
          keyboardType: keyboardType,
          style: textStyle,
          decoration: inputDecoration ??
              InputDecoration(
                hintText: hint,
                labelText: title != null ? null : label,
                prefixText: prefixText,
                suffixIcon: suffixIcon,
              ),
        ),
      ],
    );
  }
}

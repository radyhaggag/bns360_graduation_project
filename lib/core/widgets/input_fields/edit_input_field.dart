import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

import 'custom_input_field.dart';

class EditInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final double? fontSize;
  final double? heightBetweenLabelAndField;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const EditInputField({
    super.key,
    required this.controller,
    this.validator,
    this.label,
    this.fontSize,
    this.suffixIcon,
    this.heightBetweenLabelAndField,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.theme.inputDecorationTheme.labelStyle;
    return CustomInputField(
      controller: controller,
      keyboardType: TextInputType.name,
      title: label,
      validator: validator,
      suffixIcon: suffixIcon,
      label: label,
      fontSize: fontSize,
      textStyle: labelStyle?.copyWith(
        color: labelStyle.color?.withOpacity(.4),
      ),
      heightBetweenLabelAndField: heightBetweenLabelAndField,
      inputDecoration: InputDecoration(
        hintText: label,
        fillColor: context.theme.listTileTheme.tileColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

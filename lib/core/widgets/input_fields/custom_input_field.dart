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
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).cardColor,
                  ),
            ),
          ),
          const SizedBox(height: 5),
        ],
        TextFormField(
          controller: controller,
          validator: validator,
          initialValue: initialValue,
          obscureText: isSecure,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            labelText: label,
            prefixText: prefixText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

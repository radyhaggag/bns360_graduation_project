import 'package:flutter/material.dart';

import '../../utils/extensions.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController controller;
  final String? initialValue;

  const EmailInputField({
    super.key,
    required this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an email address';
        }
        if (value.isValidEmail()) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: 'Email',
      ),
    );
  }
}

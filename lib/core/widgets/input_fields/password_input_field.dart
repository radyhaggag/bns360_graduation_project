import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordInputField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a name';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: 'Password',
      ),
    );
  }
}

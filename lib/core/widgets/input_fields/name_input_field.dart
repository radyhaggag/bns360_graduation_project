import 'package:flutter/material.dart';

class NameInputField extends StatelessWidget {
  final TextEditingController controller;

  const NameInputField({
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

        final nameParts = value.split(' ');

        if (nameParts.length < 2) {
          return 'Please enter both first and last names';
        }

        return null;
      },
      decoration: const InputDecoration(
        hintText: 'Full Name',
      ),
    );
  }
}

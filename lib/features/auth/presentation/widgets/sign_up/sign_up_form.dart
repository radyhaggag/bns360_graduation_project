import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/input_fields/email_input_field.dart';
import '../../../../../core/widgets/input_fields/name_input_field.dart';
import '../../../../../core/widgets/input_fields/password_input_field.dart';
import '../../../../../core/widgets/input_fields/phone_input_field.dart';
import '../../bloc/auth_bloc.dart';
import 'sign_up_btn.dart';
import 'user_type_dropdown.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameInputField(
            controller: _nameController,
          ),
          SizedBox(height: 15.h),
          EmailInputField(
            controller: _emailController,
          ),
          SizedBox(height: 15.h),
          PasswordInputField(
            controller: _passwordController,
          ),
          SizedBox(height: 15.h),
          const UserTypeDropdown(),
          SizedBox(height: 15.h),
          PhoneInputField(
            controller: _phoneController,
          ),
          SizedBox(height: 15.h),
          SignUpBtn(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(SignUpEvent(
                      email: _emailController.text,
                      password: _passwordController.text,
                      name: _nameController.text,
                    ));
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}

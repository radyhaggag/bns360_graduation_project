import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/input_fields/email_input_field.dart';
import '../../../../../core/widgets/input_fields/password_input_field.dart';
import '../../bloc/auth_bloc.dart';
import 'forgot_password_btn.dart';
import 'login_btn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EmailInputField(
            controller: _emailController,
          ),
          const SizedBox(height: 15),
          PasswordInputField(
            controller: _passwordController,
          ),
          const SizedBox(height: 5),
          const ForgotPasswordBtn(),
          const SizedBox(height: 50),
          LoginBtn(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(LoginEvent(
                      email: _emailController.text,
                      password: _passwordController.text,
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
    super.dispose();
  }
}

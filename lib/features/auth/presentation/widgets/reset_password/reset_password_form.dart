import 'package:bns360_graduation_project/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/input_fields/password_input_field.dart';
import '../../bloc/auth_bloc.dart';
import 'reset_password_btn.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;
  const ResetPasswordForm({super.key, required this.email});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PasswordInputField(
            controller: _newPasswordController,
            title: S.of(context).newPassword,
            hint: S.of(context).enterNewPassword,
          ),
          const SizedBox(height: 20),
          ConfirmPasswordInputField(
            passwordController: _newPasswordController,
            controller: _confirmPasswordController,
          ),
          const SizedBox(height: 50),
          ResetPasswordBtn(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(ResetPasswordEvent(
                      email: widget.email,
                      newPassword: _newPasswordController.text,
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
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/language.dart';
import '../../../../../core/helpers/form_validators.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/widgets/center_progress_indicator.dart';
import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/auth_bloc.dart';
import '../label_input_field.dart';

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
          LabelInputField(
            controller: _emailController,
            label: S.of(context).email,
            hint: S.of(context).enterEmail,
            validator: (value) => FormValidator.validateEmail(value),
          ),
          SizedBox(height: 20.h),
          LabelInputField(
            controller: _passwordController,
            label: S.of(context).password,
            hint: S.of(context).enterPassword,
            validator: (value) => FormValidator.validatePassword(value),
          ),
          const SizedBox(height: 5),
          InkWell(
            onTap: () {},
            child: Align(
              alignment: context.currentLanguage == Language.english
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                S.of(context).forgotPassword,
                style: AppStyles.getMediumStyle(color: AppColors.black25),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return const CenterProgressIndicator();
              }
              return CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(LoginEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ));
                  }
                },
                label: S.of(context).login,
              );
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

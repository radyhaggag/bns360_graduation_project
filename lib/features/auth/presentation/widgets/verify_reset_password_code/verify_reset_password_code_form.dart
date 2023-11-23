import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../bloc/auth_bloc.dart';
import 'not_receive_code_tile.dart';
import 'verify_otp_code_btn.dart';

class VerifyResetPasswordCodeForm extends StatefulWidget {
  final String email;
  const VerifyResetPasswordCodeForm({super.key, required this.email});

  @override
  State<VerifyResetPasswordCodeForm> createState() =>
      _VerifyResetPasswordCodeFormState();
}

class _VerifyResetPasswordCodeFormState
    extends State<VerifyResetPasswordCodeForm> {
  final _formKey = GlobalKey<FormState>();

  bool isFilled = false;
  String otp = "";
  Color borderColor = AppColors.primary;

  getPinTheme(Color borderColor) => PinTheme(
        shape: PinCodeFieldShape.box,
        inactiveColor: AppColors.black,
        borderRadius: BorderRadius.circular(8),
        activeBorderWidth: 1,
        fieldWidth: 50,
        borderWidth: 1,
        selectedColor: AppColors.primary,
        activeColor: borderColor,
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BlocListener<AuthBloc, AuthState>(
            listener: (BuildContext context, AuthState state) {
              if (state is VerifyResetPasswordCodeErrorState) {
                setState(() => borderColor = AppColors.error);
              }
              if (state is VerifyResetPasswordCodeSuccessState) {
                setState(() => borderColor = AppColors.success);
                // TODO: REDIRECT USER TO RESET PASSWORD SCREEN
              }
            },
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              keyboardType: TextInputType.number,
              onCompleted: (_) => _verifyCode(context),
              onChanged: _onChanged,
              errorTextSpace: 25,
              pinTheme: getPinTheme(borderColor),
            ),
          ),
          NotReceiveTile(email: widget.email),
          const SizedBox(height: 30),
          VerifyOtpCodeBtn(
            onPressed: otp.length == 6 ? () => _verifyCode(context) : null,
          ),
        ],
      ),
    );
  }

  void _onChanged(value) {
    if (value.length == 6) {
      setState(() {
        otp = value;
        isFilled = true;
      });
    }
    if (value.length != 6) {
      setState(() {
        otp = value;
        isFilled = false;
      });
    }
  }

  void _verifyCode(BuildContext context) {
    context.read<AuthBloc>().add(VerifyResetPasswordCodeEvent(
          email: widget.email,
          otpCode: otp,
        ));
  }
}

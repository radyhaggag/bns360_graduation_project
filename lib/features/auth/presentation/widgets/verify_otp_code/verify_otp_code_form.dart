import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../config/route_config.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../bloc/auth_bloc.dart';
import 'not_receive_code_tile.dart';
import 'verify_otp_code_btn.dart';

class VerifyOtpCodeForm extends StatefulWidget {
  final String email;
  const VerifyOtpCodeForm({super.key, required this.email});

  @override
  State<VerifyOtpCodeForm> createState() => _VerifyOtpCodeFormState();
}

class _VerifyOtpCodeFormState extends State<VerifyOtpCodeForm> {
  final _formKey = GlobalKey<FormState>();

  bool isFilled = false;
  String otp = "";
  Color borderColor = AppColors.primary;

  getPinTheme(Color borderColor) => PinTheme(
        shape: PinCodeFieldShape.box,
        inactiveColor: Theme.of(context).primaryColor.withOpacity(.7),
        borderRadius: BorderRadius.circular(8),
        activeBorderWidth: 1,
        fieldWidth: 50,
        borderWidth: 1,
        selectedColor: AppColors.primary,
        activeColor: borderColor,
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is VerifyResetPasswordCodeErrorState) {
          setState(() => borderColor = AppColors.error);
          // TODO: DELETE THIS NAVIGATION
          Navigator.of(context).popAndPushNamed(
            Routes.resetPassword,
            arguments: widget.email,
          );
        }
        if (state is VerifyResetPasswordCodeSuccessState) {
          setState(() => borderColor = AppColors.success);
          // TODO: REDIRECT USER TO RESET PASSWORD SCREEN
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            PinCodeTextField(
              appContext: context,
              length: 6,
              keyboardType: TextInputType.number,
              onCompleted: (_) => _verifyCode(context),
              onChanged: _onChanged,
              errorTextSpace: 25,
              pinTheme: getPinTheme(borderColor),
              backgroundColor: Colors.transparent,
            ),
            NotReceiveTile(email: widget.email),
            const SizedBox(height: 30),
            VerifyOtpCodeBtn(
              onPressed: otp.length == 6 ? () => _verifyCode(context) : null,
            ),
          ],
        ),
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

import 'package:equatable/equatable.dart';

class VerifyResetPasswordParams extends Equatable {
  final String email;
  final String otpCode;

  const VerifyResetPasswordParams({
    required this.email,
    required this.otpCode,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "otp": otpCode,
    };
  }

  @override
  List<Object> get props => [email, otpCode];
}

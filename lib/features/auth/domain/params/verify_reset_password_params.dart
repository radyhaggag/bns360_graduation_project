import 'package:equatable/equatable.dart';

class VerifyResetPasswordParams extends Equatable {
  final String email;
  final String otpCode;

  const VerifyResetPasswordParams({
    required this.email,
    required this.otpCode,
  });

  @override
  List<Object> get props => [email, otpCode];
}

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class SendEmailVerificationEvent extends AuthEvent {
  final String email;

  const SendEmailVerificationEvent({required this.email});
}

class SendResetPasswordCodeEvent extends AuthEvent {
  final String email;

  const SendResetPasswordCodeEvent({required this.email});
}

class VerifyResetPasswordCodeEvent extends AuthEvent {
  final String email;
  final String otpCode;

  const VerifyResetPasswordCodeEvent({
    required this.email,
    required this.otpCode,
  });
}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String newPassword;

  const ResetPasswordEvent({
    required this.email,
    required this.newPassword,
  });
}

class ChangeUserType extends AuthEvent {
  final UserType userType;

  const ChangeUserType({
    required this.userType,
  });

  @override
  List<Object> get props => [userType];
}

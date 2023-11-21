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

class VerifyEmailEvent extends AuthEvent {
  final String email;
  final String otpCode;

  const VerifyEmailEvent({required this.email, required this.otpCode});
}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String newPassword;

  const ResetPasswordEvent({required this.email, required this.newPassword});
}

class CreateNewPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const CreateNewPasswordEvent({
    required this.email,
    required this.password,
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

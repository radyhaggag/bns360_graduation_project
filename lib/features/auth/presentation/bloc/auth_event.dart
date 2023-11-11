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

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  const RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class VerifyEmailEvent extends AuthEvent {
  final String email;

  const VerifyEmailEvent({required this.email});
}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  const ResetPasswordEvent({required this.email});
}

class CreateNewPasswordEvent extends AuthEvent {
  final String email;
  final String password;

  const CreateNewPasswordEvent({
    required this.email,
    required this.password,
  });
}

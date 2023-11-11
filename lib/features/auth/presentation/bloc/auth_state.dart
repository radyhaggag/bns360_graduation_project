part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
  final String message;

  const LoginErrorState({required this.message});
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
  final String message;

  const RegisterErrorState({required this.message});
}

class VerifyEmailLoadingState extends AuthState {}

class VerifyEmailSuccessState extends AuthState {}

class VerifyEmailErrorState extends AuthState {
  final String message;

  const VerifyEmailErrorState({required this.message});
}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends AuthState {
  final String message;

  const ResetPasswordErrorState({required this.message});
}

class CreateNewPasswordPasswordLoadingState extends AuthState {}

class CreateNewPasswordPasswordSuccessState extends AuthState {}

class CreateNewPasswordPasswordErrorState extends AuthState {
  final String message;

  const CreateNewPasswordPasswordErrorState({required this.message});
}

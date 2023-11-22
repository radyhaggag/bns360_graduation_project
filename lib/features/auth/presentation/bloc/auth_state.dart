part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class ErrorState extends AuthState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {}

class LoginErrorState extends ErrorState {
  const LoginErrorState({required super.message});
}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpErrorState extends ErrorState {
  const SignUpErrorState({required super.message});
}

class SendEmailVerificationLoadingState extends AuthState {}

class SendEmailVerificationSuccessState extends AuthState {}

class SendEmailVerificationErrorState extends ErrorState {
  const SendEmailVerificationErrorState({required super.message});
}

class SendResetPasswordCodeLoadingState extends AuthState {}

class SendResetPasswordCodeSuccessState extends AuthState {}

class SendResetPasswordCodeErrorState extends ErrorState {
  const SendResetPasswordCodeErrorState({required super.message});
}

class VerifyEmailLoadingState extends AuthState {}

class VerifyEmailSuccessState extends AuthState {}

class VerifyEmailErrorState extends ErrorState {
  const VerifyEmailErrorState({required super.message});
}

class ResetPasswordLoadingState extends AuthState {}

class ResetPasswordSuccessState extends AuthState {}

class ResetPasswordErrorState extends ErrorState {
  const ResetPasswordErrorState({required super.message});
}

class UserTypeChanged extends AuthState {
  final UserType userType;

  const UserTypeChanged({
    required this.userType,
  });

  @override
  List<Object> get props => [userType];
}

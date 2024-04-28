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

class SendResetPasswordCodeLoadingState extends AuthState {}

class SendResetPasswordCodeSuccessState extends AuthState {
  final String email;
  const SendResetPasswordCodeSuccessState({
    required this.email,
  });
}

class SendResetPasswordCodeErrorState extends ErrorState {
  const SendResetPasswordCodeErrorState({required super.message});
}

class VerifyResetPasswordCodeLoadingState extends AuthState {}

class VerifyResetPasswordCodeSuccessState extends AuthState {}

class VerifyResetPasswordCodeErrorState extends ErrorState {
  const VerifyResetPasswordCodeErrorState({required super.message});
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

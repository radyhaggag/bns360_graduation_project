import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/verify_email_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.verifyEmailUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_loginUser);
    on<RegisterEvent>(_registerUser);
    on<VerifyEmailEvent>(_verifyEmail);
    on<ResetPasswordEvent>(_resetPassword);
    on<CreateNewPasswordEvent>(_createNewPassword);
  }

  Future<void> _loginUser(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> _registerUser(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> _verifyEmail(
    VerifyEmailEvent event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> _resetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> _createNewPassword(
    CreateNewPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {}
}

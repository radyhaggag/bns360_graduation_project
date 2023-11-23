import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/send_email_verification.dart';
import '../../domain/usecases/send_reset_password_code_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../../domain/usecases/verify_reset_password_code_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final VerifyResetPasswordCodeUseCase verifyResetPasswordCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;
  final SendResetPasswordCodeUseCase sendResetPasswordCodeUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.verifyResetPasswordCodeUseCase,
    required this.resetPasswordUseCase,
    required this.sendEmailVerificationUseCase,
    required this.sendResetPasswordCodeUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
    on<SendEmailVerificationEvent>(_sendEmailVerification);
    on<SendResetPasswordCodeEvent>(_sendResetPasswordCode);
    on<VerifyResetPasswordCodeEvent>(_verifyResetPasswordCode);
    on<ResetPasswordEvent>(_resetPassword);
    on<ChangeUserType>(_changeUserType);
  }

  Future<void> _login(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final params = LoginParams(email: event.email, password: event.password);
    final res = await loginUseCase(params);

    res.fold(
      (l) => emit(LoginErrorState(message: l.message)),
      (r) => emit(LoginSuccessState()),
    );
  }

  Future<void> _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final params = SignUpParams(
      email: event.email,
      password: event.password,
      name: event.name,
    );
    final res = await signUpUseCase(params);

    res.fold(
      (l) => emit(SignUpErrorState(message: l.message)),
      (r) => emit(SignUpSuccessState()),
    );
  }

  Future<void> _sendEmailVerification(
    SendEmailVerificationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SendEmailVerificationLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await sendEmailVerificationUseCase(event.email);

    res.fold(
      (l) => emit(SendEmailVerificationErrorState(message: l.message)),
      (r) => emit(SendEmailVerificationSuccessState()),
    );
  }

  _sendResetPasswordCode(
    SendResetPasswordCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SendResetPasswordCodeLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await sendResetPasswordCodeUseCase(event.email);

    res.fold(
      (l) => emit(SendResetPasswordCodeErrorState(message: l.message)),
      (r) => emit(SendResetPasswordCodeSuccessState(email: event.email)),
    );
  }

  Future<void> _verifyResetPasswordCode(
    VerifyResetPasswordCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(VerifyResetPasswordCodeLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final params = VerifyResetPasswordParams(
      email: event.email,
      otpCode: event.otpCode,
    );

    final res = await verifyResetPasswordCodeUseCase(params);

    res.fold(
      (l) => emit(VerifyResetPasswordCodeErrorState(message: l.message)),
      (r) => emit(VerifyResetPasswordCodeSuccessState()),
    );
  }

  Future<void> _resetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(ResetPasswordLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final params = ResetPasswordParams(
      email: event.email,
      newPassword: event.newPassword,
    );
    final res = await resetPasswordUseCase(params);

    res.fold(
      (l) => emit(LoginErrorState(message: l.message)),
      (r) => emit(LoginSuccessState()),
    );
  }

  UserType? userType;

  _changeUserType(ChangeUserType event, Emitter<AuthState> emit) {
    userType = event.userType;
    emit(UserTypeChanged(userType: event.userType));
  }
}

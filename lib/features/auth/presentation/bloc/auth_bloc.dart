import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums/user_type.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/reset_password_params.dart';
import '../../domain/params/sign_up_params.dart';
import '../../domain/params/verify_reset_password_params.dart';
import '../../domain/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;

  AuthBloc({
    required this.authRepo,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
    on<SendResetPasswordCodeEvent>(_sendResetPasswordCode);
    on<VerifyResetPasswordCodeEvent>(_verifyResetPasswordCode);
    on<ResetPasswordEvent>(_resetPassword);
    on<ChangeUserTypeEvent>(_changeUserType);
    on<ContinueAsGuestEvent>(_continueAsGuest);
    on<SendConfirmationEmailEvent>(_sendConfirmationEmail);
  }

  Future<void> _login(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());

    final params = LoginParams(email: event.email, password: event.password);
    final res = await authRepo.login(params);

    res.fold(
      (l) => emit(LoginErrorState(
        message: l.message,
        email: event.email,
      )),
      (r) => emit(LoginSuccessState()),
    );
  }

  Future<void> _signUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    if (userType == null) return;
    emit(SignUpLoadingState());

    final params = SignUpParams(
      email: event.email,
      password: event.password,
      displayName: event.name,
      userType: userType!,
    );
    final res = await authRepo.signUp(params);

    res.fold(
      (l) => emit(SignUpErrorState(message: l.message)),
      (r) => emit(SignUpSuccessState()),
    );
  }

  Future<void> _sendResetPasswordCode(
    SendResetPasswordCodeEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SendResetPasswordCodeLoadingState());

    final res = await authRepo.sendResetPasswordCode(event.email);

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

    final params = VerifyResetPasswordParams(
      email: event.email,
      otpCode: event.otpCode,
    );

    final res = await authRepo.verifyResetPasswordCode(params);

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

    final params = ResetPasswordParams(
      email: event.email,
      newPassword: event.newPassword,
    );
    final res = await authRepo.resetPassword(params);

    res.fold(
      (l) => emit(ResetPasswordErrorState(message: l.message)),
      (r) => emit(ResetPasswordSuccessState()),
    );
  }

  UserType? userType;

  void _changeUserType(ChangeUserTypeEvent event, Emitter<AuthState> emit) {
    userType = event.userType;
    emit(UserTypeChanged(userType: event.userType));
  }

  Future<void> _continueAsGuest(ContinueAsGuestEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());

    final res = await authRepo.continueAsGuest();

    res.fold(
      (l) => emit(LoginErrorState(
        message: l.message,
        email: '',
      )),
      (r) => emit(LoginSuccessState()),
    );
  }

  Future<void> _sendConfirmationEmail(
    SendConfirmationEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SendConfirmationEmailLoadingState());

    final res = await authRepo.sendConfirmationEmail(event.email);

    res.fold(
      (l) => emit(SendConfirmationEmailErrorState(message: l.message)),
      (r) => emit(SendConfirmationEmailSuccessState()),
    );
  }
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/usecases/create_new_password_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/send_email_verification.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../../domain/usecases/verify_email_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final CreateNewPasswordUseCase createNewPasswordUseCase;
  final SendEmailVerificationUseCase sendEmailVerificationUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.verifyEmailUseCase,
    required this.resetPasswordUseCase,
    required this.createNewPasswordUseCase,
    required this.sendEmailVerificationUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_loginUser);
    on<SignUpEvent>(_signUpUser);
    on<VerifyEmailEvent>(_verifyEmail);
    on<ResetPasswordEvent>(_resetPassword);
    on<CreateNewPasswordEvent>(_createNewPassword);
    on<SendEmailVerificationEvent>(_sendEmailVerification);
    on<ChangeUserType>(_changeUserType);
  }

  Future<void> _loginUser(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginLoadingState());

    final params = LoginParams(email: event.email, password: event.password);
    final res = await loginUseCase(params);

    res.fold(
      (l) => emit(LoginErrorState(message: l.message)),
      (r) => emit(LoginSuccessState()),
    );
  }

  Future<void> _signUpUser(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoadingState());

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

  Future<void> _verifyEmail(
    VerifyEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(VerifyEmailLoadingState());

    final params = VerifyEmailParams(
      email: event.email,
      otpCode: event.otpCode,
    );
    final res = await verifyEmailUseCase(params);

    res.fold(
      (l) => emit(VerifyEmailErrorState(message: l.message)),
      (r) => emit(VerifyEmailSuccessState()),
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
    final res = await resetPasswordUseCase(params);

    res.fold(
      (l) => emit(LoginErrorState(message: l.message)),
      (r) => emit(LoginSuccessState()),
    );
  }

  Future<void> _createNewPassword(
    CreateNewPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(CreateNewPasswordLoadingState());

    final params = CreateNewPasswordParams(
      email: event.email,
      password: event.password,
    );
    final res = await createNewPasswordUseCase(params);

    res.fold(
      (l) => emit(CreateNewPasswordErrorState(message: l.message)),
      (r) => emit(CreateNewPasswordSuccessState()),
    );
  }

  FutureOr _sendEmailVerification(
    SendEmailVerificationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SendEmailVerificationLoadingState());

    final res = await sendEmailVerificationUseCase(event.email);

    res.fold(
      (l) => emit(SendEmailVerificationErrorState(message: l.message)),
      (r) => emit(SendEmailVerificationSuccessState()),
    );
  }

  UserType? userType;

  _changeUserType(ChangeUserType event, Emitter<AuthState> emit) {
    userType = event.userType;
    emit(UserTypeChanged(userType: event.userType));
  }
}

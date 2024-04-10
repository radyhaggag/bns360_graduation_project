import 'package:bns360_graduation_project/core/firebase/firebase_auth_manager.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../domain/params/login_params.dart';
import '../../../domain/params/reset_password_params.dart';
import '../../../domain/params/sign_up_params.dart';
import '../../../domain/params/verify_reset_password_params.dart';
import '../../models/login_model.dart';
import '../../models/sign_up_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginParams params);
  Future<SignUpModel> signUp(SignUpParams params);
  Future<bool> sendEmailVerification(String email);
  Future<bool> sendResetPasswordCode(String email);
  Future<bool> verifyResetPasswordCode(VerifyResetPasswordParams params);
  Future<bool> resetPassword(ResetPasswordParams params);
  Future<void> continueAsGuest();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final APIConsumer apiConsumer;

  AuthRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<LoginModel> login(
    LoginParams params,
  ) async {
    await FirebaseAuthManager.signInWithEmailAndPassword(
      params.email,
      params.password,
    );
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<SignUpModel> signUp(
    SignUpParams params,
  ) async {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(
    ResetPasswordParams params,
  ) async {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  ) async {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> sendEmailVerification(
    String params,
  ) async {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }

  @override
  Future<bool> sendResetPasswordCode(
    String params,
  ) async {
    // TODO: implement sendResetPasswordCode
    throw UnimplementedError();
  }

  @override
  Future<void> continueAsGuest() async {
    await FirebaseAuthManager.signInAnonymously();
  }
}

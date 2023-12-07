import '../../../../../core/api/api_consumer.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../../domain/usecases/reset_password_use_case.dart';
import '../../../domain/usecases/sign_up_use_case.dart';
import '../../../domain/usecases/verify_reset_password_code_use_case.dart';
import '../../models/login_model.dart';
import '../../models/sign_up.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginParams params);
  Future<SignUpModel> signUp(SignUpParams params);
  Future<bool> sendEmailVerification(String email);
  Future<bool> sendResetPasswordCode(String email);
  Future<bool> verifyResetPasswordCode(VerifyResetPasswordParams params);
  Future<bool> resetPassword(ResetPasswordParams params);
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
}

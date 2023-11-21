import '../../../../../core/api/api_consumer.dart';
import '../../../domain/usecases/create_new_password_use_case.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../../domain/usecases/reset_password_usecase.dart';
import '../../../domain/usecases/sign_up_use_case.dart';
import '../../../domain/usecases/verify_email_use_case.dart';
import '../../models/login_model.dart';
import '../../models/sign_up.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginParams params);
  Future<SignUpModel> signUp(SignUpParams params);
  Future<bool> sendEmailVerification(String params);
  Future<bool> verifyEmail(VerifyEmailParams params);
  Future<bool> resetPassword(ResetPasswordParams params);
  Future<bool> createNewPassword(CreateNewPasswordParams params);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final APIConsumer apiConsumer;

  AuthRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<LoginModel> login(LoginParams params) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<SignUpModel> signUp(SignUpParams params) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(ResetPasswordParams params) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyEmail(VerifyEmailParams params) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> createNewPassword(CreateNewPasswordParams params) {
    // TODO: implement createNewPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> sendEmailVerification(String params) {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }
}

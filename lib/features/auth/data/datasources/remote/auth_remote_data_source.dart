import '../../../domain/usecases/reset_password_usecase.dart';
import '../../../domain/usecases/verify_email_use_case.dart';

import '../../../../../core/errors/api/dio_manager/api_consumer.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../../domain/usecases/register_use_case.dart';
import '../../models/login_model.dart';
import '../../models/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginParams params);
  Future<RegisterModel> register(RegisterParams params);
  Future<bool> verifyEmail(VerifyEmailParams params);
  Future<bool> resetPassword(ResetPasswordParams params);
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
  Future<RegisterModel> register(RegisterParams params) {
    // TODO: implement register
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
}

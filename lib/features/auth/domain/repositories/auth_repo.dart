import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/login.dart';
import '../entities/register.dart';
import '../usecases/create_new_password_use_case.dart';
import '../usecases/login_use_case.dart';
import '../usecases/register_use_case.dart';
import '../usecases/reset_password_usecase.dart';
import '../usecases/verify_email_use_case.dart';

abstract class AuthRepo {
  Future<Either<Failure, Login>> login(LoginParams params);
  Future<Either<Failure, Register>> register(RegisterParams params);
  Future<Either<Failure, bool>> verifyEmail(VerifyEmailParams params);
  Future<Either<Failure, bool>> resetPassword(ResetPasswordParams params);
  Future<Either<Failure, bool>> createNewPassword(
      CreateNewPasswordParams params);
}

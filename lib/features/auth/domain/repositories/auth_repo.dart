import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/login.dart';
import '../entities/sign_up.dart';
import '../usecases/login_use_case.dart';
import '../usecases/reset_password_use_case.dart';
import '../usecases/sign_up_use_case.dart';
import '../usecases/verify_reset_password_code_use_case.dart';

abstract class AuthRepo {
  Future<Either<Failure, Login>> login(LoginParams params);
  Future<Either<Failure, SignUp>> signUp(SignUpParams params);
  Future<Either<Failure, bool>> sendEmailVerification(String email);
  Future<Either<Failure, bool>> sendResetPasswordCode(String email);
  Future<Either<Failure, bool>> resetPassword(ResetPasswordParams params);
  Future<Either<Failure, bool>> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  );
}

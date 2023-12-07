import '../../../../core/utils/custom_types.dart';
import '../entities/login.dart';
import '../entities/sign_up.dart';
import '../usecases/login_use_case.dart';
import '../usecases/reset_password_use_case.dart';
import '../usecases/sign_up_use_case.dart';
import '../usecases/verify_reset_password_code_use_case.dart';

abstract class AuthRepo {
  Future<ResultOrFailure<Login>> login(LoginParams params);
  Future<ResultOrFailure<SignUp>> signUp(SignUpParams params);
  Future<ResultOrFailure<bool>> sendEmailVerification(String email);
  Future<ResultOrFailure<bool>> sendResetPasswordCode(String email);
  Future<ResultOrFailure<bool>> resetPassword(ResetPasswordParams params);
  Future<ResultOrFailure<bool>> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  );
}

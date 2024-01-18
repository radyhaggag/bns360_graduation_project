import '../../../../core/utils/custom_types.dart';
import '../entities/login_entity.dart';
import '../entities/sign_up_entity.dart';
import '../usecases/login_use_case.dart';
import '../usecases/reset_password_use_case.dart';
import '../usecases/sign_up_use_case.dart';
import '../usecases/verify_reset_password_code_use_case.dart';

abstract class AuthRepo {
  Future<ResultOrFailure<LoginEntity>> login(LoginParams params);
  Future<ResultOrFailure<SignUpEntity>> signUp(SignUpParams params);
  Future<ResultOrFailure<bool>> sendEmailVerification(String email);
  Future<ResultOrFailure<bool>> sendResetPasswordCode(String email);
  Future<ResultOrFailure<bool>> resetPassword(ResetPasswordParams params);
  Future<ResultOrFailure<bool>> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  );
}

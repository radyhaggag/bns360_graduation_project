import '../../../../core/utils/custom_types.dart';
import '../entities/login_entity.dart';
import '../entities/sign_up_entity.dart';
import '../params/login_params.dart';
import '../params/reset_password_params.dart';
import '../params/sign_up_params.dart';
import '../params/verify_reset_password_params.dart';

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

import '../../../../core/utils/custom_types.dart';
import '../entities/login_entity.dart';
import '../entities/sign_up_entity.dart';
import '../params/login_params.dart';
import '../params/reset_password_params.dart';
import '../params/sign_up_params.dart';
import '../params/verify_reset_password_params.dart';

abstract class AuthRepo {
  FutureEither<LoginEntity> login(LoginParams params);
  FutureEither<SignUpEntity> signUp(SignUpParams params);
  FutureEither<bool> sendEmailVerification(String email);
  FutureEither<bool> sendResetPasswordCode(String email);
  FutureEither<bool> resetPassword(ResetPasswordParams params);
  FutureEither<bool> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  );
  FutureEither<void> continueAsGuest();
}

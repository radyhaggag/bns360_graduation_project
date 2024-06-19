import '../../domain/params/login_params.dart';
import '../../domain/params/reset_password_params.dart';
import '../../domain/params/sign_up_params.dart';
import '../../domain/params/verify_reset_password_params.dart';
import '../models/login_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginModel> login(LoginParams params);
  Future<void> signUp(SignUpParams params);
  Future<bool> sendResetPasswordCode(String email);
  Future<bool> verifyResetPasswordCode(VerifyResetPasswordParams params);
  Future<bool> resetPassword(ResetPasswordParams params);
  Future<void> continueAsGuest();
  Future<void> sendConfirmationEmail(
    String email,
  );
}

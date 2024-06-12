import '../../../../core/utils/enums/user_type.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/databases/secure_storage/token_manager.dart';
import '../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../../../core/utils/app_endpoints.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/reset_password_params.dart';
import '../../domain/params/sign_up_params.dart';
import '../../domain/params/verify_reset_password_params.dart';
import '../models/login_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final APIConsumer apiConsumer;
  final TokenManager tokenManager;

  AuthRemoteDataSourceImpl({
    required this.apiConsumer,
    required this.tokenManager,
  });

  @override
  Future<LoginModel> login(LoginParams params) async {
    final res = await apiConsumer.post(
      endpoint: AppEndpoints.login,
      data: params.toJson(),
    );

    final loginModel = LoginModel.fromJson(res.data);

    await tokenManager.saveToken(loginModel.token);

    final profile = ProfileEntity(
      id: loginModel.userId,
      email: loginModel.email,
      name: loginModel.displayName,
      userType: loginModel.role,
    );

    await profile.saveToCache();

    return loginModel;
  }

  @override
  Future<void> signUp(SignUpParams params) {
    return apiConsumer.post(
      endpoint: AppEndpoints.register,
      data: params.toJson(),
    );
  }

  @override
  Future<bool> resetPassword(
    ResetPasswordParams params,
  ) async {
    await apiConsumer.put(
      endpoint: AppEndpoints.resetPassword,
      data: params.toJson(),
    );
    return true;
  }

  @override
  Future<bool> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  ) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.verifyOtp,
      data: params.toJson(),
    );

    return true;
  }

  @override
  Future<bool> sendResetPasswordCode(
    String email,
  ) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.forgetPassword,
      headers: {"email": email},
      data: {},
    );
    return true;
  }

  @override
  Future<void> continueAsGuest() async {
    final profile = ProfileEntity(
      id: "guest-${DateTime.now().millisecondsSinceEpoch}",
      email: "guest_${DateTime.now().microsecondsSinceEpoch}@mail.com",
      name: "Guest User",
      userType: UserType.guest.id,
    );

    await profile.saveToCache();
  }
}

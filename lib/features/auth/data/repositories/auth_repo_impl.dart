import '../../../../core/databases/secure_storage/secure_storage_manager.dart';
import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/params/login_params.dart';
import '../../domain/params/reset_password_params.dart';
import '../../domain/params/sign_up_params.dart';
import '../../domain/params/verify_reset_password_params.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final SecureStorageManager secureStorageManager;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.secureStorageManager,
  });

  @override
  FutureEither<LoginEntity> login(
    LoginParams params,
  ) async {
    return executeAndHandleErrorAsync<LoginEntity>(
      () => authRemoteDataSource.login(params),
    );
  }

  @override
  FutureEither<SignUpEntity> signUp(
    SignUpParams params,
  ) async {
    return executeAndHandleErrorAsync<SignUpEntity>(
      () => authRemoteDataSource.signUp(params),
    );
  }

  @override
  FutureEither<bool> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  ) async {
    return executeAndHandleErrorAsync<bool>(
      () => authRemoteDataSource.verifyResetPasswordCode(params),
    );
  }

  @override
  FutureEither<bool> resetPassword(
    ResetPasswordParams params,
  ) async {
    return executeAndHandleErrorAsync<bool>(
      () => authRemoteDataSource.resetPassword(params),
    );
  }

  @override
  FutureEither<bool> sendEmailVerification(String email) async {
    return executeAndHandleErrorAsync<bool>(
      () => authRemoteDataSource.sendEmailVerification(email),
    );
  }

  @override
  FutureEither<bool> sendResetPasswordCode(String email) async {
    return executeAndHandleErrorAsync<bool>(
      () => authRemoteDataSource.sendResetPasswordCode(email),
    );
  }

  @override
  FutureEither<void> continueAsGuest() async {
    return executeAndHandleErrorAsync<void>(
      () => authRemoteDataSource.continueAsGuest(),
    );
  }
}

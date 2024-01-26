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
  Future<ResultOrFailure<LoginEntity>> login(
    LoginParams params,
  ) async {
    return executeAndHandleError<LoginEntity>(
      () => authRemoteDataSource.login(params),
    );
  }

  @override
  Future<ResultOrFailure<SignUpEntity>> signUp(
    SignUpParams params,
  ) async {
    return executeAndHandleError<SignUpEntity>(
      () => authRemoteDataSource.signUp(params),
    );
  }

  @override
  Future<ResultOrFailure<bool>> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  ) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.verifyResetPasswordCode(params),
    );
  }

  @override
  Future<ResultOrFailure<bool>> resetPassword(
    ResetPasswordParams params,
  ) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.resetPassword(params),
    );
  }

  @override
  Future<ResultOrFailure<bool>> sendEmailVerification(String email) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.sendEmailVerification(email),
    );
  }

  @override
  Future<ResultOrFailure<bool>> sendResetPasswordCode(String email) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.sendResetPasswordCode(email),
    );
  }
}

import 'package:bns360_graduation_project/core/helpers/execute_and_handle_error.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/databases/secure_storage/secure_storage_manager.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/sign_up.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/reset_password_use_case.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import '../../domain/usecases/verify_reset_password_code_use_case.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final SecureStorageManager secureStorageManager;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.secureStorageManager,
  });

  @override
  Future<Either<Failure, Login>> login(
    LoginParams params,
  ) async {
    return executeAndHandleError<Login>(
      () => authRemoteDataSource.login(params),
    );
  }

  @override
  Future<Either<Failure, SignUp>> signUp(
    SignUpParams params,
  ) async {
    return executeAndHandleError<SignUp>(
      () => authRemoteDataSource.signUp(params),
    );
  }

  @override
  Future<Either<Failure, bool>> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  ) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.verifyResetPasswordCode(params),
    );
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
    ResetPasswordParams params,
  ) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.resetPassword(params),
    );
  }

  @override
  Future<Either<Failure, bool>> sendEmailVerification(String email) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.sendEmailVerification(email),
    );
  }

  @override
  Future<Either<Failure, bool>> sendResetPasswordCode(String email) async {
    return executeAndHandleError<bool>(
      () => authRemoteDataSource.sendResetPasswordCode(email),
    );
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/databases/secure_storage/secure_storage_manager.dart';
import '../../../../core/errors/error_handler.dart';
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
  final SecureStorageManager appShared;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.appShared,
  });

  @override
  Future<Either<Failure, Login>> login(
    LoginParams params,
  ) async {
    try {
      final result = await authRemoteDataSource.login(params);
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, SignUp>> signUp(
    SignUpParams params,
  ) async {
    try {
      final result = await authRemoteDataSource.signUp(params);
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> verifyResetPasswordCode(
    VerifyResetPasswordParams params,
  ) async {
    try {
      final result = await authRemoteDataSource.verifyResetPasswordCode(params);
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
    ResetPasswordParams params,
  ) async {
    try {
      final result = await authRemoteDataSource.resetPassword(params);
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> sendEmailVerification(String params) async {
    try {
      final result = await authRemoteDataSource.sendEmailVerification(params);
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, bool>> sendResetPasswordCode(String params) async {
    try {
      final result = await authRemoteDataSource.sendResetPasswordCode(params);
      return Right(result);
    } catch (e) {
      final failure = ErrorHandler.handle(e).failure;
      return Left(failure);
    }
  }
}

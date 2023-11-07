import 'package:dartz/dartz.dart';

import '../../../../config/shared_preferences.dart';
import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/register_use_case.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/verify_email_use_case.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  final AppShared appShared;

  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.appShared,
  });

  @override
  Future<Either<Failure, Login>> login(LoginParams params) async {
    try {
      final result = await authRemoteDataSource.login(params);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Register>> register(RegisterParams params) async {
    try {
      final result = await authRemoteDataSource.register(params);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> verifyEmail(VerifyEmailParams params) async {
    try {
      final result = await authRemoteDataSource.verifyEmail(params);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordParams params) async {
    try {
      final result = await authRemoteDataSource.resetPassword(params);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}

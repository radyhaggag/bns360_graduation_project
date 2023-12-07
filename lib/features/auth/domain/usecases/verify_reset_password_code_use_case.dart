import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repositories/auth_repo.dart';

class VerifyResetPasswordCodeUseCase
    extends UseCase<bool, VerifyResetPasswordParams> {
  final AuthRepo authRepo;

  VerifyResetPasswordCodeUseCase({required this.authRepo});

  @override
  Future<ResultOrFailure<bool>> call(VerifyResetPasswordParams params) {
    return authRepo.verifyResetPasswordCode(params);
  }
}

class VerifyResetPasswordParams extends Equatable {
  final String email;
  final String otpCode;

  const VerifyResetPasswordParams({
    required this.email,
    required this.otpCode,
  });

  @override
  List<Object> get props => [email, otpCode];
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repositories/auth_repo.dart';

class VerifyEmailUseCase extends UseCase<bool, VerifyEmailParams> {
  final AuthRepo authRepo;

  VerifyEmailUseCase({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(VerifyEmailParams params) {
    return authRepo.verifyEmail(params);
  }
}

class VerifyEmailParams extends Equatable {
  final String email;
  final String otpCode;

  const VerifyEmailParams({
    required this.email,
    required this.otpCode,
  });

  @override
  List<Object> get props => [email, otpCode];
}

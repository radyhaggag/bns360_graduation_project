import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repositories/auth_repo.dart';

class SendEmailVerificationUseCase extends UseCase<bool, String> {
  final AuthRepo authRepo;

  SendEmailVerificationUseCase({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(String params) {
    return authRepo.sendEmailVerification(params);
  }
}

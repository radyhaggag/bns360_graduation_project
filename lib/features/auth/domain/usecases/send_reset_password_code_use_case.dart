import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/base_use_case.dart';
import '../repositories/auth_repo.dart';

class SendResetPasswordCodeUseCase extends UseCase<bool, String> {
  final AuthRepo authRepo;

  SendResetPasswordCodeUseCase({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(String params) {
    return authRepo.sendResetPasswordCode(params);
  }
}

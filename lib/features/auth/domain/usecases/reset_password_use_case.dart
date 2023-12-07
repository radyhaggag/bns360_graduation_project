import 'package:equatable/equatable.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../../../core/utils/custom_types.dart';
import '../repositories/auth_repo.dart';

class ResetPasswordUseCase extends UseCase<bool, ResetPasswordParams> {
  final AuthRepo authRepo;

  ResetPasswordUseCase({required this.authRepo});

  @override
  Future<ResultOrFailure<bool>> call(ResetPasswordParams params) {
    return authRepo.resetPassword(params);
  }
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String newPassword;

  const ResetPasswordParams({
    required this.email,
    required this.newPassword,
  });

  @override
  List<Object> get props => [email, newPassword];
}

import '../../../../core/use_case/base_use_case.dart';
import '../../../../core/utils/custom_types.dart';
import '../repositories/auth_repo.dart';

class SendEmailVerificationUseCase extends UseCase<bool, String> {
  final AuthRepo authRepo;

  SendEmailVerificationUseCase({required this.authRepo});

  @override
  Future<ResultOrFailure<bool>> call(String params) {
    return authRepo.sendEmailVerification(params);
  }
}

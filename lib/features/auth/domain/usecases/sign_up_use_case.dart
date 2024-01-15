import 'package:equatable/equatable.dart';

import '../../../../core/use_case/base_use_case.dart';
import '../../../../core/utils/custom_types.dart';
import '../entities/sign_up.dart';
import '../repositories/auth_repo.dart';

class SignUpUseCase extends UseCase<SignUp, SignUpParams> {
  final AuthRepo authRepo;

  SignUpUseCase({required this.authRepo});

  @override
  Future<ResultOrFailure<SignUp>> call(SignUpParams params) {
    return authRepo.signUp(params);
  }
}

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

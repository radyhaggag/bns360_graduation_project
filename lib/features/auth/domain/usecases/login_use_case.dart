import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/login.dart';
import '../repositories/auth_repo.dart';

class LoginUseCase extends UseCase<Login, LoginParams> {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  @override
  Future<Either<Failure, Login>> call(LoginParams params) {
    return authRepo.login(params);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

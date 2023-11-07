import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../entities/register.dart';
import '../repositories/auth_repo.dart';

class RegisterUseCase extends UseCase<Register, RegisterParams> {
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) {
    return authRepo.register(params);
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

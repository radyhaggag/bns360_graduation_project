import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repositories/auth_repo.dart';

class CreateNewPasswordUseCase extends UseCase<bool, CreateNewPasswordParams> {
  final AuthRepo authRepo;

  CreateNewPasswordUseCase({required this.authRepo});

  @override
  Future<Either<Failure, bool>> call(CreateNewPasswordParams params) {
    return authRepo.createNewPassword(params);
  }
}

class CreateNewPasswordParams extends Equatable {
  final String email;
  final String password;

  const CreateNewPasswordParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

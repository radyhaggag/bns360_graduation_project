import '../../config/injector_container.dart';
import 'data/datasources/remote/auth_remote_data_source.dart';
import 'data/repositories/auth_repo_impl.dart';
import 'domain/repositories/auth_repo.dart';
import 'domain/usecases/create_new_password_use_case.dart';
import 'domain/usecases/login_use_case.dart';
import 'domain/usecases/reset_password_usecase.dart';
import 'domain/usecases/send_email_verification.dart';
import 'domain/usecases/sign_up_use_case.dart';
import 'domain/usecases/verify_email_use_case.dart';
import 'presentation/bloc/auth_bloc.dart';

void initAuth() {
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(authRepo: sl()),
  );
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(authRepo: sl()),
  );
  sl.registerLazySingleton<VerifyEmailUseCase>(
    () => VerifyEmailUseCase(authRepo: sl()),
  );
  sl.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(authRepo: sl()),
  );
  sl.registerLazySingleton<CreateNewPasswordUseCase>(
    () => CreateNewPasswordUseCase(authRepo: sl()),
  );
  sl.registerLazySingleton<SendEmailVerificationUseCase>(
    () => SendEmailVerificationUseCase(authRepo: sl()),
  );

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authRemoteDataSource: sl(),
      appShared: sl(),
    ),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiConsumer: sl()),
  );

  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      signUpUseCase: sl(),
      loginUseCase: sl(),
      resetPasswordUseCase: sl(),
      verifyEmailUseCase: sl(),
      createNewPasswordUseCase: sl(),
      sendEmailVerificationUseCase: sl(),
    ),
  );
}

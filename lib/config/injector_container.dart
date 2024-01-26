import 'package:bns360_graduation_project/features/categories/categories_injector.dart';
import 'package:bns360_graduation_project/features/favorites/favorites_injector.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../core/api/api_consumer.dart';
import '../core/api/dio_consumer.dart';
import '../core/databases/secure_storage/secure_storage_manager.dart';
import '../core/helpers/cache_helper.dart';
import '../core/localization/localization_bloc.dart';
import '../features/auth/auth_injector.dart';
import '../features/home/home_injector.dart';
import '../features/splash/splash_injector.dart';

final sl = GetIt.instance; // Service Locator

Future<void> initAppDependencies() async {
  await initCore();
  initSplash();
  initAuth();
  initHome();
  initFavorites();
  initCategories();
}

Future<void> initCore() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<LogInterceptor>(
    () => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  // Dio Factory
  sl.registerLazySingleton<APIConsumer>(
    () => DioConsumer(dio: sl()),
  );
  // Flutter Secure Storage
  sl.registerLazySingleton(
    () => const FlutterSecureStorage(),
  );
  // Secure Storage Manager
  sl.registerLazySingleton<SecureStorageManager>(
    () => SecureStorageManager(storage: sl()),
  );
  // Cache Helper
  sl.registerLazySingleton(
    () => CacheHelper(sl()),
  );
  // Localization Bloc
  sl.registerFactory(
    () => LocalizationBloc(sl()),
  );
}

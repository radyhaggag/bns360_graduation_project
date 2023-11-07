import '../core/localization/localization_bloc.dart';
import '../core/utils/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/errors/api/dio_manager/api_consumer.dart';
import '../core/errors/api/dio_manager/dio_consumer.dart';
import '../features/auth/auth_injector.dart';
import 'shared_preferences.dart';

final sl = GetIt.instance; // Service Locator

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

  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );
  // App Shared
  sl.registerLazySingleton<AppShared>(
    () => AppShared(sharedPreferences: sl()),
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

Future<void> initAppDependencies() async {
  await initCore();
  initAuth();
}

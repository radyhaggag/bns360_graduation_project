import '../../config/injector_container.dart';
import 'presentation/bloc/splash_bloc.dart';

void initSplash() {
  sl.registerFactory(
    () => SplashBloc(
      cacheHelper: sl(),
    ),
  );
}

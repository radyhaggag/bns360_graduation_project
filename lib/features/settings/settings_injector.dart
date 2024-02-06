import '../../config/injector_container.dart';
import 'presentation/bloc/settings_bloc.dart';

initSettings() {
  // Bloc
  sl.registerFactory(
    () => SettingsBloc(
      cacheHelper: sl(),
    ),
  );
}

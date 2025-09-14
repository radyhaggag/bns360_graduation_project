import '../../config/injector_container.dart';
import 'presentation/bloc/settings_bloc.dart';

void initSettings() {
  // Bloc
  sl.registerFactory(
    () => SettingsBloc(
      cacheHelper: sl(),
    ),
  );
}

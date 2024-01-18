import '../../config/injector_container.dart';
import 'presentation/bloc/favorites_bloc.dart';

initFavorites() {
  // Bloc
  sl.registerFactory(
    () => FavoritesBloc(),
  );
}

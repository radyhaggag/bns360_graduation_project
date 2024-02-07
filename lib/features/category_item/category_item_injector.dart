import '../../config/injector_container.dart';
import 'presentation/bloc/category_item_bloc.dart';

initCategoryItem() {
  // Bloc
  sl.registerFactory(
    () => CategoryItemBloc(),
  );
}

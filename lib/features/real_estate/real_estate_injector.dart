import '../../config/injector_container.dart';
import 'presentation/bloc/real_estate_bloc.dart';

initRealEstate() {
  sl.registerFactory(
    () => RealEstateBloc(),
  );
}

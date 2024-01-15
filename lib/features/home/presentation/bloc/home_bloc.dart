import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/category_details_entity.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/usecases/get_banners_use_case.dart';
import '../../domain/usecases/get_categories_use_case.dart';
import '../../domain/usecases/get_places_to_explore_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBannersUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetPlacesToExploreUseCase getPlacesToExploreUseCase;
  HomeBloc({
    required this.getBannersUseCase,
    required this.getCategoriesUseCase,
    required this.getPlacesToExploreUseCase,
  }) : super(HomeInitial()) {
    on<GetBannersEvent>(_getBanners);
    on<GetCategoriesEvent>(_getCatteries);
    on<GetPlacesToExploreEvent>(_getPlacesToExplore);
  }

  _getBanners(
    GetBannersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetBannersLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await getBannersUseCase(null);

    res.fold(
      (l) => emit(GetBannersErrorState(message: l.message)),
      (r) => emit(GetBannersSuccessState(banners: r)),
    );
  }

  _getCatteries(
    GetCategoriesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetCategoriesLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await getCategoriesUseCase(null);

    res.fold(
      (l) => emit(GetCategoriesErrorState(message: l.message)),
      (r) => emit(GetCategoriesSuccessState(categories: r)),
    );
  }

  List<CategoryDetailsEntity> placesToExplore = [];

  _getPlacesToExplore(
    GetPlacesToExploreEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetPlacesToExploreLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await getPlacesToExploreUseCase(null);

    res.fold(
      (l) => emit(GetPlacesToExploreErrorState(message: l.message)),
      (r) {
        placesToExplore = r;
        emit(GetPlacesToExploreSuccessState(placesToExplore: r));
      },
    );
  }
}

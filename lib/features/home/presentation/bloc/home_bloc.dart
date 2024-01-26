import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/repositories/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  HomeBloc({
    required this.homeRepo,
  }) : super(HomeInitial()) {
    on<GetBannersEvent>(_getBanners);
    on<GetPlacesToExploreEvent>(_getPlacesToExplore);
  }

  _getBanners(
    GetBannersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetBannersLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await homeRepo.getBanners();

    res.fold(
      (l) => emit(GetBannersErrorState(message: l.message)),
      (r) => emit(GetBannersSuccessState(banners: r)),
    );
  }

  List<CategoryItemEntity> placesToExplore = [];

  _getPlacesToExplore(
    GetPlacesToExploreEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(GetPlacesToExploreLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await homeRepo.getPlacesToExplore();

    res.fold(
      (l) => emit(GetPlacesToExploreErrorState(message: l.message)),
      (r) {
        placesToExplore = r;
        emit(GetPlacesToExploreSuccessState(placesToExplore: r));
      },
    );
  }
}

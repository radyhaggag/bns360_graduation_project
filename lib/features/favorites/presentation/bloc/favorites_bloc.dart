import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../domain/repositories/favorites_repo.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepo favoritesRepo;

  FavoritesBloc(this.favoritesRepo) : super(FavoritesInitial()) {
    on<GetFavoriteCategoriesEvent>(_getFavoriteCategories);
    on<GetFavoriteCraftsmenEvent>(_getFavoriteCraftsmen);
  }

  List<CategoryItemEntity> favoriteCategories = [];

  _getFavoriteCategories(
    GetFavoriteCategoriesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(GetFavoriteCategoriesLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await favoritesRepo.getFavoriteCategories();

    res.fold(
      (l) => emit(GetFavoriteCategoriesErrorState(message: l.message)),
      (r) {
        favoriteCategories = r;
        emit(GetFavoriteCategoriesSuccessState(favorites: r));
      },
    );
  }

  List<CraftsmanEntity> favoriteCraftsmen = [];

  _getFavoriteCraftsmen(
    GetFavoriteCraftsmenEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(GetFavoriteCraftsmenLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await favoritesRepo.getFavoriteCraftsmen();

    res.fold(
      (l) => emit(GetFavoriteCraftsmenErrorState(message: l.message)),
      (r) {
        favoriteCraftsmen = r;
        emit(GetFavoriteCraftsmenSuccessState(favorites: r));
      },
    );
  }
}

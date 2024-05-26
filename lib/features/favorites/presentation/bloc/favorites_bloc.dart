import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/databases/local_storage/hive_manager.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../domain/repositories/favorites_repo.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepo favoritesRepo;

  FavoritesBloc({required this.favoritesRepo}) : super(FavoritesInitial()) {
    on<GetFavoriteCategoriesEvent>(_getFavoriteCategories);
    on<GetFavoriteCraftsmenEvent>(_getFavoriteCraftsmen);
    on<ChangeCurrentView>(_changeCurrentView);

    on<AddCategoryItemToFavorite>(_addCategoryItemToFavorite);
    on<RemoveCategoryItemFromFavorite>(_removeCategoryItemFromFavorite);
    on<AddCraftsmanToFavorite>(_addCraftsmanToFavorite);
    on<RemoveCraftsmanFromFavorite>(_removeCraftsmanFromFavorite);
  }

  List<int> get savedFavoriteCategoriesIds {
    return HiveBoxes.favoriteBusiness.values.toList();
  }

  List<int> get savedFavoriteCraftsmenIds {
    return HiveBoxes.favoriteCrafts.values.toList();
  }

  List<CategoryItemEntity> favoriteCategories = [];

  _getFavoriteCategories(
    GetFavoriteCategoriesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(GetFavoriteCategoriesLoadingState());

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

    final res = await favoritesRepo.getFavoriteCraftsmen();

    res.fold(
      (l) => emit(GetFavoriteCraftsmenErrorState(message: l.message)),
      (r) {
        favoriteCraftsmen = r;
        emit(GetFavoriteCraftsmenSuccessState(favorites: r));
      },
    );
  }

  int activeTabIndex = 0;

  _changeCurrentView(
    ChangeCurrentView event,
    Emitter<FavoritesState> emit,
  ) {
    activeTabIndex = event.index;
    if (activeTabIndex == 0) {
      add(GetFavoriteCategoriesEvent());
    }
    if (activeTabIndex == 1) {
      add(GetFavoriteCraftsmenEvent());
    }
    emit(CurrentViewChanged(index: activeTabIndex));
  }

  _addCategoryItemToFavorite(
    AddCategoryItemToFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(AddCategoryItemToFavoriteLoadingState(itemId: event.itemId));

    final res = await favoritesRepo.addCategoryItemToFavorite(
      event.itemId,
    );

    res.fold(
      (l) => emit(AddCategoryItemToFavoriteErrorState(
        message: l.message,
        itemId: event.itemId,
      )),
      (r) => emit(AddCategoryItemToFavoriteSuccessState(
        itemId: event.itemId,
      )),
    );
  }

  _removeCategoryItemFromFavorite(
    RemoveCategoryItemFromFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(RemoveCategoryItemFromFavoriteLoadingState(
      itemId: event.itemId,
    ));

    final res = await favoritesRepo.removeCategoryItemFromFavorite(
      event.itemId,
    );

    res.fold(
      (l) => emit(RemoveCategoryItemFromFavoriteErrorState(
        message: l.message,
        itemId: event.itemId,
      )),
      (r) {
        favoriteCategories.removeWhere(
          (element) => element.id == event.itemId,
        );
        emit(RemoveCategoryItemFromFavoriteSuccessState(
          itemId: event.itemId,
        ));
      },
    );
  }

  _addCraftsmanToFavorite(
    AddCraftsmanToFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(AddCraftsmanToFavoriteLoadingState(itemId: event.itemId));

    final res = await favoritesRepo.addCraftsmanToFavorite(
      event.itemId,
    );

    res.fold(
      (l) => emit(AddCraftsmanToFavoriteErrorState(
        message: l.message,
        itemId: event.itemId,
      )),
      (r) => emit(AddCraftsmanToFavoriteSuccessState(
        itemId: event.itemId,
      )),
    );
  }

  _removeCraftsmanFromFavorite(
    RemoveCraftsmanFromFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(RemoveCraftsmanFromFavoriteLoadingState(
      itemId: event.itemId,
    ));

    final res = await favoritesRepo.removeCraftsmanFromFavorite(
      event.itemId,
    );

    res.fold(
      (l) => emit(RemoveCraftsmanFromFavoriteErrorState(
        message: l.message,
        itemId: event.itemId,
      )),
      (r) {
        favoriteCraftsmen.removeWhere(
          (element) => element.id == event.itemId,
        );

        emit(RemoveCraftsmanFromFavoriteSuccessState(
          itemId: event.itemId,
        ));
      },
    );
  }
}

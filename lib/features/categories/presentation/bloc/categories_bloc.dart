import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../domain/repositories/categories_repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesBloc({
    required this.categoriesRepo,
  }) : super(CategoriesInitial()) {
    on<GetCategoriesEvent>(_getCatteries);
    on<ToggleSearchIcon>(_toggleSearchIcon);
    on<SearchOnCategoryItems>(_searchOnCategoryItems);
    on<GetCategoryItemsByIdEvent>(_getCategoryItemsById);
  }

  List<CategoryEntity>? categories;

  _getCatteries(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(GetCategoriesLoadingState());

    final res = await categoriesRepo.getCategories();

    res.fold(
      (l) => emit(GetCategoriesErrorState(message: l.message)),
      (r) {
        categories = r;
        emit(GetCategoriesSuccessState(categories: r));
      },
    );
  }

  List<CategoryItemEntity> items = [];

  bool isSearchEnabled = false;
  final searchController = TextEditingController();

  _toggleSearchIcon(
    ToggleSearchIcon event,
    Emitter<CategoriesState> emit,
  ) {
    isSearchEnabled = !isSearchEnabled;
    emit(SearchIconToggled(isSearchEnabled: isSearchEnabled));
    if (!isSearchEnabled && searchController.text.isNotEmpty) {
      searchController.clear();
      add(GetCategoryItemsByIdEvent(categoryId: event.categoryId));
    }
  }

  _searchOnCategoryItems(
    SearchOnCategoryItems event,
    Emitter<CategoriesState> emit,
  ) async {
    final searchVal = searchController.text.trim();
    if (searchVal.isEmpty) return;

    emit(GetCategoryItemsLoadingState());

    final searchLowercase = searchVal.toLowerCase();
    bool isTrue(CategoryItemEntity item) {
      final itemNameLowercaseAR = item.businessNameArabic.toLowerCase();
      final itemNameLowercaseENG = item.businessNameEnglish.toLowerCase();
      return (searchLowercase.contains(itemNameLowercaseAR) ||
              itemNameLowercaseAR.contains(searchLowercase)) ||
          (searchLowercase.contains(itemNameLowercaseENG) ||
                  itemNameLowercaseENG.contains(searchLowercase)) &&
              item.id == event.categoryId;
    }

    final filteredItems = items.where(isTrue).toList();

    emit(GetCategoryItemsSuccessState(items: filteredItems));
  }

  _getCategoryItemsById(
    GetCategoryItemsByIdEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(GetCategoryItemsLoadingState());

    final res = await categoriesRepo.getCategoryItemsById(
      event.categoryId,
    );

    res.fold(
      (l) => emit(GetCategoryItemsErrorState(message: l.message)),
      (r) {
        items = r;
        emit(GetCategoryItemsSuccessState(items: r));
      },
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/shared_data/entities/category_item_info_entity.dart';
import '../../domain/repositories/categories_repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepo categoriesRepo;
  CategoriesBloc({
    required this.categoriesRepo,
  }) : super(CategoriesInitial()) {
    initListener();

    on<GetCategoriesEvent>(_getCatteries);
    on<ToggleSearchIcon>(_toggleSearchIcon);
    on<SearchOnCategoryItems>(_searchOnCategoryItems);
    on<GetCategoryItemsByIdEvent>(_getCategoryItemsById);
  }

  initListener() {
    searchController.addListener(() {
      if ((categoryItems ?? []).isEmpty) return;
      add(SearchOnCategoryItems(categoryId: categoryItems!.first.id));
    });
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

  List<CategoryItemInfoEntity>? categoryItems;
  List<CategoryItemInfoEntity> searchResults = [];

  List<CategoryItemInfoEntity> get items {
    if (isSearchEnabled) {
      return searchResults;
    } else {
      return categoryItems ?? [];
    }
  }

  bool isSearchEnabled = false;
  final searchController = TextEditingController();

  _toggleSearchIcon(
    ToggleSearchIcon event,
    Emitter<CategoriesState> emit,
  ) {
    isSearchEnabled = !isSearchEnabled;
    emit(SearchIconToggled(isSearchEnabled: isSearchEnabled));
  }

  _searchOnCategoryItems(
    SearchOnCategoryItems event,
    Emitter<CategoriesState> emit,
  ) async {
    final searchVal = searchController.text.trim();
    final searchLowercase = searchVal.toLowerCase();

    bool isTrue(CategoryItemInfoEntity item) {
      if (searchLowercase.isEmpty) return true;

      final itemNameLowercaseAR = item.businessNameArabic.toLowerCase();
      final itemNameLowercaseENG = item.businessNameEnglish.toLowerCase();
      return (searchLowercase.contains(itemNameLowercaseAR) ||
              itemNameLowercaseAR.contains(searchLowercase)) ||
          (searchLowercase.contains(itemNameLowercaseENG) ||
              itemNameLowercaseENG.contains(searchLowercase));
    }

    searchResults = (categoryItems ?? []).where(isTrue).toList();

    emit(GetCategoryItemsSuccessState(items: searchResults));
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
        categoryItems = r;
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

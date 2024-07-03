import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_info_entity.dart';
import '../../domain/repositories/crafts_repo.dart';

part 'crafts_event.dart';
part 'crafts_state.dart';

class CraftsBloc extends Bloc<CraftsEvent, CraftsState> {
  final CraftsRepo craftsRepo;
  CraftsBloc({required this.craftsRepo}) : super(CraftsInitial()) {
    initListener();
    on<GetCraftsEvent>(_getCrafts);
    on<GetCraftItemsByIdEvent>(_getCraftItemsById);
    on<ToggleSearchIcon>(_toggleSearchIcon);
    on<SearchOnCrafts>(_searchOnCrafts);
  }

  initListener() {
    searchController.addListener(() {
      if ((craftsmen ?? []).isEmpty) return;
      add(SearchOnCrafts());
    });
  }

  List<CraftsmanInfoEntity>? craftsmen;
  List<CraftsmanInfoEntity> searchResults = [];

  List<CraftEntity>? _crafts;
  List<CraftEntity>? get crafts => _crafts;

  List<CraftsmanInfoEntity>? get items {
    if (isSearchEnabled) {
      return searchResults;
    }
    return craftsmen;
  }

  int selectedCraftId = 0;

  String? selectedCraftName(BuildContext context) {
    if (crafts == null) return "";
    if (crafts != null && crafts!.isEmpty) return "";
    final selectedCraft = crafts?.firstWhere(
      (craft) => craft.id == selectedCraftId,
    );
    if (selectedCraft == null) return "";
    return LocalizationHelper.getLocalizedString(
      context,
      ar: selectedCraft.nameAR,
      en: selectedCraft.nameEN,
    );
  }

  _getCrafts(
    GetCraftsEvent event,
    Emitter<CraftsState> emit,
  ) async {
    if (crafts != null) return;
    emit(GetCraftsLoadingState());

    final res = await craftsRepo.getCrafts();

    res.fold(
      (l) => emit(GetCraftsErrorState(message: l.message)),
      (r) {
        _crafts = r;
        if (r.isNotEmpty) {
          add(GetCraftItemsByIdEvent(id: r.first.id));
        }
        emit(GetCraftsSuccessState(crafts: r));
      },
    );
  }

  _getCraftItemsById(
    GetCraftItemsByIdEvent event,
    Emitter<CraftsState> emit,
  ) async {
    int prevSelectedId = selectedCraftId;

    selectedCraftId = event.id;

    // thats mean the selected craft is "ALL" so fetch all data
    if (searchController.text.isNotEmpty) {
      add(SearchOnCrafts());
      return;
    }
    emit(GetCraftItemsByIdLoadingState());

    final res = await craftsRepo.getCraftItemsById(selectedCraftId);

    res.fold(
      (l) {
        selectedCraftId = prevSelectedId;
        craftsmen = [];
        emit(GetCraftItemsByIdErrorState(message: l.message));
      },
      (r) {
        craftsmen = r;
        emit(GetCraftItemsByIdSuccessState(craftsmen: r));
      },
    );
  }

  bool isSearchEnabled = false;
  final searchController = TextEditingController();

  _toggleSearchIcon(
    ToggleSearchIcon event,
    Emitter<CraftsState> emit,
  ) {
    isSearchEnabled = !isSearchEnabled;
    if (isSearchEnabled) {
      searchResults = (craftsmen ?? []).where((element) => true).toList();
    }
    emit(SearchIconToggled(isSearchEnabled: isSearchEnabled));
  }

  _searchOnCrafts(
    SearchOnCrafts event,
    Emitter<CraftsState> emit,
  ) async {
    final searchVal = searchController.text.trim();
    final searchLowercase = searchVal.toLowerCase();

    bool isTrue(CraftsmanInfoEntity item) {
      if (searchLowercase.isEmpty) return true;
      final itemNameLowercaseAR = item.craftsmanNameArabic.toLowerCase();
      final itemNameLowercaseENG = item.craftsmanNameEnglish.toLowerCase();
      return (searchLowercase.contains(itemNameLowercaseAR) ||
              itemNameLowercaseAR.contains(searchLowercase)) ||
          (searchLowercase.contains(itemNameLowercaseENG) ||
              itemNameLowercaseENG.contains(searchLowercase));
    }

    searchResults = (craftsmen ?? []).where(isTrue).toList();

    emit(GetCraftItemsByIdSuccessState(craftsmen: searchResults));
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

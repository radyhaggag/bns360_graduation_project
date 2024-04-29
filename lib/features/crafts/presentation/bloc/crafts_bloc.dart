import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/localization_helper.dart';
import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/repositories/crafts_repo.dart';

part 'crafts_event.dart';
part 'crafts_state.dart';

class CraftsBloc extends Bloc<CraftsEvent, CraftsState> {
  final CraftsRepo craftsRepo;
  CraftsBloc({required this.craftsRepo}) : super(CraftsInitial()) {
    on<GetCraftsmenEvent>(_getCraftsmen);
    on<GetCraftsEvent>(_getCrafts);
    on<GetCraftItemsByIdEvent>(_getCraftItemsById);
    on<ToggleSearchIcon>(_toggleSearchIcon);
    on<SearchOnCrafts>(_searchOnCrafts);
  }

  List<CraftsmanEntity> craftsmen = [];
  List<CraftsmanEntity> searchResults = [];

  _getCraftsmen(
    GetCraftsmenEvent event,
    Emitter<CraftsState> emit,
  ) async {
    emit(GetCraftsmenLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await craftsRepo.getCraftsmen();

    res.fold(
      (l) => emit(GetCraftsmenErrorState(message: l.message)),
      (r) {
        craftsmen = r;
        emit(GetCraftsmenSuccessState(craftsmen: r));
      },
    );
  }

  final craftAllEntity = const CraftEntity(
    id: "-1",
    nameAR: 'الجميع',
    nameEN: 'All',
  );

  List<CraftEntity>? _crafts;
  List<CraftEntity>? get crafts {
    if (_crafts != null) {
      return [craftAllEntity, ..._crafts!];
    }
    return null;
  }

  String selectedCraftId = "-1";

  String? selectedCraftName(BuildContext context) {
    var selectedCraft = crafts?.firstWhere(
      (craft) => craft.id == selectedCraftId,
      orElse: () => craftAllEntity,
    );
    selectedCraft ??= craftAllEntity;
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
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await craftsRepo.getCrafts();

    res.fold(
      (l) => emit(GetCraftsErrorState(message: l.message)),
      (r) {
        _crafts = r;
        emit(GetCraftsSuccessState(crafts: r));
      },
    );
  }

  _getCraftItemsById(
    GetCraftItemsByIdEvent event,
    Emitter<CraftsState> emit,
  ) async {
    String prevSelectedId = selectedCraftId;

    selectedCraftId = event.id;

    // thats mean the selected craft is "ALL" so fetch all data
    if (selectedCraftId == -1) {
      if (searchController.text.isNotEmpty) {
        add(SearchOnCrafts());
      } else {
        add(GetCraftsmenEvent());
      }
      return;
    }
    if (searchController.text.isNotEmpty) {
      add(SearchOnCrafts());
      return;
    }
    emit(GetCraftsmenLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await craftsRepo.getCraftItemsById(selectedCraftId);

    res.fold(
      (l) {
        selectedCraftId = prevSelectedId;
        emit(GetCraftsmenErrorState(message: l.message));
      },
      (r) {
        craftsmen = r;
        emit(GetCraftsmenSuccessState(craftsmen: r));
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
    emit(SearchIconToggled(isSearchEnabled: isSearchEnabled));
    if (!isSearchEnabled && searchController.text.isNotEmpty) {
      searchController.clear();
      add(GetCraftsmenEvent());
    }
  }

  _searchOnCrafts(
    SearchOnCrafts event,
    Emitter<CraftsState> emit,
  ) async {
    final searchVal = searchController.text.trim();
    if (searchVal.isEmpty) return;

    emit(GetCraftsmenLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    ResultOrFailure<List<CraftsmanEntity>> res;
    if (selectedCraftId == -1) {
      res = await craftsRepo.searchOnAllCrafts(
        searchVal,
      );
    } else {
      res = await craftsRepo.searchOnCraftsById(
        selectedCraftId,
        searchVal,
      );
    }

    res.fold(
      (l) {
        emit(GetCraftsmenErrorState(message: l.message));
      },
      (r) {
        craftsmen = r;
        emit(GetCraftsmenSuccessState(craftsmen: r));
      },
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

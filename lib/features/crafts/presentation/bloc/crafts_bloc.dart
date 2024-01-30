import 'dart:async';

import 'package:bns360_graduation_project/core/utils/custom_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
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

  List<CraftEntity>? crafts;

  int selectedCraftId = -1;

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
        crafts = r;
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
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  _searchOnCrafts(
    SearchOnCrafts event,
    Emitter<CraftsState> emit,
  ) async {
    emit(GetCraftsmenLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    ResultOrFailure<List<CraftsmanEntity>> res;
    if (selectedCraftId == -1) {
      res = await craftsRepo.searchOnAllCrafts(
        searchController.text,
      );
    } else {
      res = await craftsRepo.searchOnCraftsById(
        selectedCraftId,
        searchController.text,
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
}

import 'dart:async';

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
  }

  List<CraftsmanEntity> craftsmen = [];

  _getCraftsmen(
    GetCraftsmenEvent event,
    Emitter<CraftsState> emit,
  ) async {
    emit(GetCraftsmenLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

    final res = await craftsRepo.getCraftsmen();

    res.fold(
      (l) => emit(GetCraftsmenErrorState(message: l.message)),
      (r) {
        craftsmen = r;
        emit(GetCraftsmenSuccessState(craftsmen: r));
      },
    );
  }

  List<CraftEntity> crafts = [];

  int selectedCraftId = -1;

  _getCrafts(
    GetCraftsEvent event,
    Emitter<CraftsState> emit,
  ) async {
    if (crafts.isNotEmpty) return;
    emit(GetCraftsLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

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
      add(GetCraftsmenEvent());
      return;
    }
    emit(GetCraftsmenLoadingState());
    await Future.delayed(const Duration(seconds: 2)); // TODO: FOR TEST

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
}

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/property_entity.dart';
import '../../domain/repositories/properties_repo.dart';

part 'properties_event.dart';
part 'properties_state.dart';

class PropertiesBloc extends Bloc<PropertiesEvent, PropertiesState> {
  final PropertiesRepo propertiesRepo;

  PropertiesBloc({required this.propertiesRepo}) : super(PropertiesInitial()) {
    on<GetPropertiesEvent>(_getProperties);
    on<GetPropertyByIdEvent>(_getPropertyById);
    on<SearchOnProperties>(_searchOnProperties);
  }

  List<PropertyEntity> properties = [];
  List<PropertyEntity> searchResults = [];

  _getProperties(
    GetPropertiesEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(GetPropertiesLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final res = await propertiesRepo.getProperties();

    res.fold(
      (l) => emit(GetPropertiesErrorState(message: l.message)),
      (r) {
        properties = r;
        emit(GetPropertiesSuccessState(properties: r));
      },
    );
  }

  bool isSearchEnabled = false;
  final searchController = TextEditingController();

  _searchOnProperties(
    SearchOnProperties event,
    Emitter<PropertiesState> emit,
  ) async {
    final searchVal = searchController.text.trim();
    if (searchVal.isEmpty) {
      isSearchEnabled = false;
      add(GetPropertiesEvent());
      return;
    }
    isSearchEnabled = true;

    emit(GetPropertiesLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await propertiesRepo.searchOnProperties(searchVal);

    res.fold(
      (l) {
        emit(GetPropertiesErrorState(message: l.message));
      },
      (r) {
        searchResults = r;
        emit(GetPropertiesSuccessState(properties: r));
      },
    );
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  _getPropertyById(
    GetPropertyByIdEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(GetPropertyByIdLoadingState());
    await Future.delayed(const Duration(seconds: 1));

    final res = await propertiesRepo.getPropertyById(event.id);

    res.fold(
      (l) => emit(GetPropertyByIdErrorState(message: l.message)),
      (r) {
        emit(GetPropertyByIdSuccessState(property: r));
      },
    );
  }
}

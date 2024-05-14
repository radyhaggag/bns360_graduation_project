import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/shared_data/entities/property_entity.dart';
import '../../domain/repositories/properties_repo.dart';
import '../../params/add_property_params.dart';

part 'properties_event.dart';
part 'properties_state.dart';

class PropertiesBloc extends Bloc<PropertiesEvent, PropertiesState> {
  final PropertiesRepo propertiesRepo;

  PropertiesBloc({required this.propertiesRepo}) : super(PropertiesInitial()) {
    on<GetPropertiesEvent>(_getProperties);
    on<GetPropertyByIdEvent>(_getPropertyById);
    on<SearchOnPropertiesEvent>(_searchOnProperties);
    on<SelectPropertyLocationEvent>(_selectPropertyLocation);
    on<AddPropertyEvent>(_addProperty);
    on<EditPropertyEvent>(_editProperty);
    on<PickPropertyImagesEvent>(_pickPropertyImages);
    on<RemovePickedPropertyImageEvent>(_removePropertyImages);
    on<ClearPropertyImagesEvent>(_clearPropertyImages);
    on<InitNetworkPropertyImageEvent>(_initNetworkPropertyImage);
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
    SearchOnPropertiesEvent event,
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

    final searchLowercase = searchVal.toLowerCase();
    bool isTrue(String itemName) {
      final itemNameLowercase = itemName.toLowerCase();
      return searchLowercase.contains(itemNameLowercase) ||
          itemNameLowercase.contains(searchLowercase);
    }

    final filteredItems = properties
        .where(
          (item) =>
              isTrue(item.arabicAddress) ||
              isTrue(item.arabicAddress) ||
              isTrue(item.arabicDescription) ||
              isTrue(item.englishDescription),
        )
        .toList();

    searchResults = filteredItems;
    emit(GetPropertiesSuccessState(properties: filteredItems));
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

  double? _propertyLat;
  double? _propertyLng;

  _selectPropertyLocation(
    SelectPropertyLocationEvent event,
    Emitter<PropertiesState> emit,
  ) {
    _propertyLat = event.lat;
    _propertyLng = event.lng;
  }

  _addProperty(
    AddPropertyEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(AddPropertyLoadingState());
    final params = event.addPropertyParams.copyWith(
      lat: _propertyLat,
      lng: _propertyLng,
      images: _pickedImages,
    );
    final res = await propertiesRepo.addProperty(params);

    res.fold(
      (l) => emit(AddPropertyErrorState(message: l.message)),
      (r) => emit(const AddPropertySuccessState()),
    );
  }

  final List<File> _pickedImages = [];
  List<File> get pickedImages => _pickedImages;

  _pickPropertyImages(
    PickPropertyImagesEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    if (_pickedImages.length == 3) {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _pickedImages.add(File(image.path));
      }
      emit(PropertyImagesUpdatedState());
    } else {
      final images = await picker.pickMultiImage();

      if (images.isNotEmpty) {
        final length = images.length > 4 ? 4 : images.length;
        for (int i = 0; i < length; i++) {
          if (_pickedImages.length >= 4) break;
          _pickedImages.add(File(images[i].path));
        }
        emit(PropertyImagesUpdatedState());
      }
    }
  }

  _removePropertyImages(
    RemovePickedPropertyImageEvent event,
    Emitter<PropertiesState> emit,
  ) {
    _pickedImages.removeAt(event.index);
    emit(PropertyImagesUpdatedState());
  }

  _editProperty(EditPropertyEvent event, Emitter<PropertiesState> emit) async {
    emit(EditPropertyLoadingState());
    final params = event.propertyEntity.copyWith(
      latitude: _propertyLat,
      longitude: _propertyLng,
      images: _pickedImages.map((e) => e.path).toList(),
    );
    final res = await propertiesRepo.editProperty(params);

    res.fold(
      (l) => emit(EditPropertyErrorState(message: l.message)),
      (r) => emit(const EditPropertySuccessState()),
    );
  }

  List<String> networkImages = [];

  _clearPropertyImages(
    ClearPropertyImagesEvent event,
    Emitter<PropertiesState> emit,
  ) {
    networkImages.clear();
    pickedImages.clear();
    emit(PropertyImagesUpdatedState());
  }

  _initNetworkPropertyImage(
    InitNetworkPropertyImageEvent event,
    Emitter<PropertiesState> emit,
  ) {
    networkImages = event.networkImages.map((e) => e).toList();
    emit(PropertyImagesUpdatedState());
  }
}

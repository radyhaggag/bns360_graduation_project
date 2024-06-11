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
    initListener();
    on<GetPropertiesEvent>(_getProperties);
    on<SearchOnPropertiesEvent>(_searchOnProperties);
    on<SelectPropertyLocationEvent>(_selectPropertyLocation);
    on<AddPropertyEvent>(_addProperty);
    on<EditPropertyEvent>(_editProperty);
    on<PickPropertyImagesEvent>(_pickPropertyImages);
    on<RemovePickedPropertyImageEvent>(_removePropertyImages);
    on<ClearPropertyImagesEvent>(_clearPropertyImages);
    on<InitNetworkPropertyImageEvent>(_initNetworkPropertyImage);
  }

  initListener() {
    searchController.addListener(() {
      if ((properties).isEmpty) return;
      add(SearchOnPropertiesEvent());
    });
  }

  List<PropertyEntity> properties = [];
  List<PropertyEntity> searchResults = [];

  List<PropertyEntity> get items {
    if (isSearchEnabled) {
      return searchResults;
    }
    return properties;
  }

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

  bool get isSearchEnabled => searchController.text.trim().isNotEmpty;
  final searchController = TextEditingController();

  _searchOnProperties(
    SearchOnPropertiesEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    final searchVal = searchController.text.trim();
    final searchLowercase = searchVal.toLowerCase();

    bool isTrue(PropertyEntity item) {
      if (searchLowercase.isEmpty) return true;
      final itemNameLowercaseAR = item.arabicDescription.toLowerCase();
      final itemNameLowercaseENG = item.englishDescription.toLowerCase();
      final addressLowercaseAR = item.arabicAddress.toLowerCase();
      final addressLowercaseENG = item.englishAddress.toLowerCase();
      return (searchLowercase.contains(itemNameLowercaseAR) ||
              itemNameLowercaseAR.contains(searchLowercase)) ||
          (searchLowercase.contains(itemNameLowercaseENG) ||
              itemNameLowercaseENG.contains(searchLowercase)) ||
          (searchLowercase.contains(addressLowercaseAR) ||
              addressLowercaseAR.contains(searchLowercase)) ||
          (searchLowercase.contains(addressLowercaseENG) ||
              addressLowercaseENG.contains(searchLowercase));
    }

    searchResults = (properties).where(isTrue).toList();

    emit(GetPropertiesSuccessState(properties: searchResults));
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }

  double? propertyLat;
  double? propertyLng;

  _selectPropertyLocation(
    SelectPropertyLocationEvent event,
    Emitter<PropertiesState> emit,
  ) {
    propertyLat = event.lat;
    propertyLng = event.lng;

    emit(PropertyLocationSelectedState(lat: event.lat, lng: event.lng));
  }

  _addProperty(
    AddPropertyEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(AddPropertyLoadingState());
    if (propertyLat == null || propertyLng == null) {
      emit(const AddPropertyErrorState(
          message: 'Please select property location'));
      return;
    }
    final params = event.addPropertyParams.copyWith(
      lat: propertyLat,
      lng: propertyLng,
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
      latitude: propertyLat,
      longitude: propertyLng,
      image1: _pickedImages.firstOrNull?.path,
      image2: _pickedImages.length > 1 ? _pickedImages[1].path : null,
      image3: _pickedImages.length > 2 ? _pickedImages[2].path : null,
      image4: _pickedImages.length > 3 ? _pickedImages[3].path : null,
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

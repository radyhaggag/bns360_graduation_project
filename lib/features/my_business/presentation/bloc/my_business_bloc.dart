import 'dart:io';

import 'package:bns360_graduation_project/core/utils/enums/work_days.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/shared_data/entities/category_entity.dart';
import '../../../../core/shared_data/entities/category_item_entity.dart';
import '../../../../core/utils/extensions/iterable.dart';
import '../../domain/params/add_business_params.dart';
import '../../domain/repositories/my_business_repo.dart';

part 'my_business_event.dart';
part 'my_business_state.dart';

class MyBusinessBloc extends Bloc<MyBusinessEvent, MyBusinessState> {
  final MyBusinessRepo myBusinessRepo;

  MyBusinessBloc({
    required this.myBusinessRepo,
  }) : super(MyBusinessInitial()) {
    on<GetMyBusinessEvent>(_getMyBusiness);
    on<GetBusinessTypesEvent>(_getBusinessTypes);
    on<AddBusinessEvent>(_addBusiness);
    on<UpdateBusinessEvent>(_updateBusiness);
    on<SelectBusinessLocationEvent>(_selectPropertyLocation);
    on<PickBusinessImagesEvent>(_pickBusinessImages);
    on<RemovePickedBusinessImageEvent>(_removeBusinessImages);
    on<ClearBusinessImagesEvent>(_clearBusinessImages);
    on<InitNetworkBusinessImageEvent>(_initNetworkBusinessImage);
    on<SelectBusinessCategoryEvent>(_selectBusinessCategory);
    on<ClearMainBusinessImageEvent>(_clearMainBusinessImageE);
    on<AddMainBusinessImageEvent>(_addMainBusinessImageE);
    on<DeleteMyBusinessEvent>(_deleteMyBusiness);
    on<SelectBusinessHolidayEvent>(_selectBusinessHoliday);
  }

  double? businessLat;
  double? businessLng;

  _selectPropertyLocation(
    SelectBusinessLocationEvent event,
    Emitter<MyBusinessState> emit,
  ) {
    businessLat = event.lat;
    businessLng = event.lng;

    emit(BusinessLocationUpdatedState(
      lat: businessLat!,
      lng: businessLng!,
    ));
  }

  final List<File> _pickedImages = [];
  List<File> get pickedImages => _pickedImages;

  _pickBusinessImages(
    PickBusinessImagesEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    if (_pickedImages.length == 3) {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _pickedImages.add(File(image.path));
      }
      emit(BusinessImagesUpdatedState());
    } else {
      final images = await picker.pickMultiImage();

      if (images.isNotEmpty) {
        final length = images.length > 4 ? 4 : images.length;
        for (int i = 0; i < length; i++) {
          if (_pickedImages.length >= 4) break;
          _pickedImages.add(File(images[i].path));
        }
        emit(BusinessImagesUpdatedState());
      }
    }
  }

  _removeBusinessImages(
    RemovePickedBusinessImageEvent event,
    Emitter<MyBusinessState> emit,
  ) {
    _pickedImages.removeAt(event.index);
    emit(BusinessImagesUpdatedState());
  }

  List<String> networkImages = [];
  String? mainNetworkImage;

  _clearBusinessImages(
    ClearBusinessImagesEvent event,
    Emitter<MyBusinessState> emit,
  ) {
    networkImages.clear();
    pickedImages.clear();
    emit(BusinessImagesUpdatedState());
  }

  _initNetworkBusinessImage(
    InitNetworkBusinessImageEvent event,
    Emitter<MyBusinessState> emit,
  ) {
    networkImages = event.networkImages.map((e) => e).toList();
    mainNetworkImage = event.mainBusinessImage;
    emit(BusinessImagesUpdatedState());
  }

  List<CategoryItemEntity> myBusinessItems = [];

  _getMyBusiness(
    GetMyBusinessEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    emit(GetMyBusinessLoadingState());

    final res = await myBusinessRepo.getMyBusiness();

    res.fold(
      (l) => emit(GetMyBusinessErrorState(message: l.message)),
      (r) {
        myBusinessItems = r;
        emit(GetMyBusinessSuccessState());
      },
    );
  }

  List<CategoryEntity> businessCategories = [];

  _getBusinessTypes(
    GetBusinessTypesEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    emit(GetBusinessTypesLoadingState());

    final res = await myBusinessRepo.getBusinessCategories();

    res.fold(
      (l) => emit(GetBusinessTypesErrorState(message: l.message)),
      (r) {
        businessCategories = r;
        emit(GetBusinessTypesSuccessState());
      },
    );
  }

  _addBusiness(
    AddBusinessEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    emit(AddBusinessLoadingState());

    final params = event.addBusinessParams.copyWith(
      lat: businessLat,
      lng: businessLng,
      businessCategory: selectedBusinessCategory,
      mainBusinessBackgroundImages: pickedImages.map((e) => e.path).toList(),
      mainBusinessImage: _mainBusinessImage?.path,
      holiday: holiday,
    );

    final res = await myBusinessRepo.addBusiness(params);

    res.fold(
      (l) => emit(AddBusinessErrorState(message: l.message)),
      (r) => emit(AddBusinessSuccessState()),
    );
  }

  _updateBusiness(
    UpdateBusinessEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    emit(UpdateBusinessLoadingState());

    final params = event.categoryItemEntity.copyWith(
      latitude: businessLat,
      longitude: businessLng,
      removeImages: pickedImages.isEmpty,
      categoriesModelId: selectedBusinessCategory?.id,
      businessImageName1: pickedImages.isNotEmpty ? pickedImages[0].path : null,
      businessImageName2: pickedImages.length > 1 ? pickedImages[1].path : null,
      businessImageName3: pickedImages.length > 2 ? pickedImages[2].path : null,
      businessImageName4: pickedImages.length > 2 ? pickedImages[3].path : null,
      profileImageName: _mainBusinessImage?.path,
      holidays: holiday.id,
    );

    final res = await myBusinessRepo.updateBusiness(params);

    res.fold(
      (l) => emit(UpdateBusinessErrorState(message: l.message)),
      (r) => emit(UpdateBusinessSuccessState()),
    );
  }

  CategoryEntity? selectedBusinessCategory;

  _selectBusinessCategory(
    SelectBusinessCategoryEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    selectedBusinessCategory = businessCategories.firstWhereOrNull(
      (e) => e.id == event.categoryId,
    );
    if (selectedBusinessCategory == null) return;

    emit(BusinessCategoryUpdatedState(
      businessCategory: selectedBusinessCategory!,
    ));
  }

  File? _mainBusinessImage;
  File? get mainBusinessImage => _mainBusinessImage;

  _clearMainBusinessImageE(
    ClearMainBusinessImageEvent event,
    Emitter<MyBusinessState> emit,
  ) {
    _mainBusinessImage = null;
    mainNetworkImage = null;
    emit(MainBusinessImageUpdatedState());
  }

  _addMainBusinessImageE(
    AddMainBusinessImageEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _mainBusinessImage = File(image.path);
    }
    emit(MainBusinessImageUpdatedState());
  }

  bool get isAllImagesSelected {
    return _mainBusinessImage != null && pickedImages.isNotEmpty;
  }

  _deleteMyBusiness(
    DeleteMyBusinessEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    emit(DeleteBusinessLoadingState());

    final res = await myBusinessRepo.deleteBusiness(event.businessId);

    res.fold(
      (l) => emit(DeleteBusinessErrorState(message: l.message)),
      (r) {
        myBusinessItems.removeWhere(
          (element) => element.id == event.businessId,
        );
        emit(DeleteBusinessSuccessState());
      },
    );
  }

  WorkDay holiday = WorkDay.friday;

  _selectBusinessHoliday(
    SelectBusinessHolidayEvent event,
    Emitter<MyBusinessState> emit,
  ) async {
    holiday = event.holiday;

    emit(BusinessHolidayUpdatedState());
  }
}

import 'dart:io';

import '../../../../core/utils/enums/work_days.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/shared_data/entities/craft_entity.dart';
import '../../../../core/shared_data/entities/craftsman_entity.dart';
import '../../domain/params/add_service_params.dart';
import '../../domain/repositories/my_services_repo.dart';

part 'my_services_event.dart';
part 'my_services_state.dart';

class MyServicesBloc extends Bloc<MyServicesEvent, MyServicesState> {
  final MyServicesRepo myServicesRepo;

  MyServicesBloc({
    required this.myServicesRepo,
  }) : super(MyServicesInitial()) {
    on<GetMyServicesEvent>(_getMyServices);
    on<GetServiceTypesEvent>(_getServiceTypes);
    on<AddServiceEvent>(_addService);
    on<UpdateServiceEvent>(_updateService);
    on<PickServiceImagesEvent>(_pickServiceImages);
    on<RemovePickedServiceImageEvent>(_removeServiceImages);
    on<ClearServiceImagesEvent>(_clearServiceImages);
    on<InitNetworkServiceImageEvent>(_initNetworkServiceImage);
    on<SelectServiceCategoryEvent>(_selectServiceCategory);
    on<ClearMainServiceImageEvent>(_clearMainServiceImageE);
    on<AddMainServiceImageEvent>(_addMainServiceImageE);
    on<DeleteMyServicesEvent>(_deleteMyServices);
    on<SelectServiceHolidayEvent>(_selectHolidayWorkday);
  }

  final List<File> _pickedImages = [];
  List<File> get pickedImages => _pickedImages;

  _pickServiceImages(
    PickServiceImagesEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    if (_pickedImages.length == 3) {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _pickedImages.add(File(image.path));
      }
      emit(ServiceImagesUpdatedState());
    } else {
      final images = await picker.pickMultiImage();

      if (images.isNotEmpty) {
        final length = images.length > 4 ? 4 : images.length;
        for (int i = 0; i < length; i++) {
          if (_pickedImages.length >= 4) break;
          _pickedImages.add(File(images[i].path));
        }
        emit(ServiceImagesUpdatedState());
      }
    }
  }

  _removeServiceImages(
    RemovePickedServiceImageEvent event,
    Emitter<MyServicesState> emit,
  ) {
    _pickedImages.removeAt(event.index);
    emit(ServiceImagesUpdatedState());
  }

  List<String> networkImages = [];
  String? mainNetworkImage;

  _clearServiceImages(
    ClearServiceImagesEvent event,
    Emitter<MyServicesState> emit,
  ) {
    networkImages.clear();
    pickedImages.clear();
    emit(ServiceImagesUpdatedState());
  }

  _initNetworkServiceImage(
    InitNetworkServiceImageEvent event,
    Emitter<MyServicesState> emit,
  ) {
    networkImages = event.networkImages.map((e) => e).toList();
    mainNetworkImage = event.mainServiceImage;
    emit(ServiceImagesUpdatedState());
  }

  List<CraftsmanEntity> myServicesItems = [];

  _getMyServices(
    GetMyServicesEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    emit(GetMyServicesLoadingState());

    final res = await myServicesRepo.getMyServices();

    res.fold(
      (l) => emit(GetMyServicesErrorState(message: l.message)),
      (r) {
        myServicesItems = r;
        emit(GetMyServicesSuccessState());
      },
    );
  }

  List<CraftEntity> serviceCategories = [];

  _getServiceTypes(
    GetServiceTypesEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    emit(GetServiceTypesLoadingState());

    final res = await myServicesRepo.getServiceCategories();

    res.fold(
      (l) => emit(GetServiceTypesErrorState(message: l.message)),
      (r) {
        serviceCategories = r;
        emit(GetServiceTypesSuccessState());
      },
    );
  }

  _addService(
    AddServiceEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    emit(AddServiceLoadingState());

    final params = event.addServiceParams.copyWith(
        // lat: _serviceLat,
        // lng: _serviceLng,
        serviceCategory: selectedServiceCraft,
        mainServiceBackgroundImages: pickedImages.map((e) => e.path).toList(),
        mainServiceImage: _mainServiceImage?.path,
        holiday: holiday);

    final res = await myServicesRepo.addService(params);

    res.fold(
      (l) => emit(AddServiceErrorState(message: l.message)),
      (r) => emit(AddServiceSuccessState()),
    );
  }

  _updateService(
    UpdateServiceEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    emit(UpdateServiceLoadingState());

    final params = event.craftsmanEntity.copyWith(
      removeImages: pickedImages.isEmpty,
      craftsModelId: selectedServiceCraft?.id,
      imageName1: pickedImages.isNotEmpty ? pickedImages[0].path : null,
      imageName2: pickedImages.length > 1 ? pickedImages[1].path : null,
      imageName3: pickedImages.length > 2 ? pickedImages[2].path : null,
      imageName4: pickedImages.length > 2 ? pickedImages[3].path : null,
      profileImageUrl: mainServiceImage?.path,
      holidays: holiday.id,
    );

    final res = await myServicesRepo.updateService(params);

    res.fold(
      (l) => emit(UpdateServiceErrorState(message: l.message)),
      (r) => emit(UpdateServiceSuccessState()),
    );
  }

  CraftEntity? selectedServiceCraft;

  _selectServiceCategory(
    SelectServiceCategoryEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    selectedServiceCraft = event.serviceCategory;
    if (selectedServiceCraft == null) return;

    emit(ServiceCategoryUpdatedState(
      serviceCategory: selectedServiceCraft!,
    ));
  }

  WorkDay holiday = WorkDay.friday;

  _selectHolidayWorkday(
    SelectServiceHolidayEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    holiday = event.holiday;

    emit(ServiceHolidayUpdatedState(holiday: holiday));
  }

  File? _mainServiceImage;
  File? get mainServiceImage => _mainServiceImage;

  _clearMainServiceImageE(
    ClearMainServiceImageEvent event,
    Emitter<MyServicesState> emit,
  ) {
    _mainServiceImage = null;
    mainNetworkImage = null;
    emit(MainServiceImageUpdatedState());
  }

  _addMainServiceImageE(
    AddMainServiceImageEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _mainServiceImage = File(image.path);
    }
    emit(MainServiceImageUpdatedState());
  }

  bool get isAllImagesSelected {
    return _mainServiceImage != null && pickedImages.isNotEmpty;
  }

  _deleteMyServices(
    DeleteMyServicesEvent event,
    Emitter<MyServicesState> emit,
  ) async {
    emit(DeleteMyServiceLoadingState());

    final res = await myServicesRepo.deleteService(
      event.serviceId,
    );

    res.fold(
      (l) => emit(DeleteMyServiceErrorState(message: l.message)),
      (r) {
        myServicesItems.removeWhere(
          (element) => element.id == event.serviceId,
        );
        emit(DeleteMyServiceSuccessState());
      },
    );
  }
}

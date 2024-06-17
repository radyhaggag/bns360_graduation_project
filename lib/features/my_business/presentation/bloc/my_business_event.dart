part of 'my_business_bloc.dart';

abstract class MyBusinessEvent {
  const MyBusinessEvent();
}

class GetMyBusinessEvent extends MyBusinessEvent {}

class GetBusinessTypesEvent extends MyBusinessEvent {}

class AddBusinessEvent extends MyBusinessEvent {
  final AddBusinessParams addBusinessParams;

  const AddBusinessEvent({required this.addBusinessParams});
}

class UpdateBusinessEvent extends MyBusinessEvent {
  final CategoryItemEntity categoryItemEntity;

  const UpdateBusinessEvent({required this.categoryItemEntity});
}

class SelectBusinessLocationEvent extends MyBusinessEvent {
  final double lat;
  final double lng;

  const SelectBusinessLocationEvent({
    required this.lat,
    required this.lng,
  });
}

class PickBusinessImagesEvent extends MyBusinessEvent {}

class RemovePickedBusinessImageEvent extends MyBusinessEvent {
  final int index;

  const RemovePickedBusinessImageEvent({required this.index});
}

class ClearBusinessImagesEvent extends MyBusinessEvent {}

class ClearMainBusinessImageEvent extends MyBusinessEvent {}

class AddMainBusinessImageEvent extends MyBusinessEvent {}

class InitNetworkBusinessImageEvent extends MyBusinessEvent {
  final List<String> networkImages;
  final String mainBusinessImage;

  const InitNetworkBusinessImageEvent({
    required this.networkImages,
    required this.mainBusinessImage,
  });
}

class SelectBusinessCategoryEvent extends MyBusinessEvent {
  // final CategoryEntity businessCategory;
  final int categoryId;

  const SelectBusinessCategoryEvent({required this.categoryId});
}

class DeleteMyBusinessEvent extends MyBusinessEvent {
  final int businessId;

  const DeleteMyBusinessEvent({required this.businessId});
}

class SelectBusinessHolidayEvent extends MyBusinessEvent {
  final WorkDay holiday;

  const SelectBusinessHolidayEvent({required this.holiday});
}

class SetIsAlwaysAvailableValueEvent extends MyBusinessEvent {
  final bool isAlwaysAvailable;

  const SetIsAlwaysAvailableValueEvent({
    required this.isAlwaysAvailable,
  });
} 
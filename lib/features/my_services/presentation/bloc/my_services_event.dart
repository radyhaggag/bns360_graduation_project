part of 'my_services_bloc.dart';

abstract class MyServicesEvent {
  const MyServicesEvent();
}

class GetMyServicesEvent extends MyServicesEvent {}

class GetServiceTypesEvent extends MyServicesEvent {}

class AddServiceEvent extends MyServicesEvent {
  final AddServiceParams addServiceParams;

  const AddServiceEvent({required this.addServiceParams});
}

class UpdateServiceEvent extends MyServicesEvent {
  final CraftsmanEntity craftsmanEntity;

  const UpdateServiceEvent({required this.craftsmanEntity});
}

class PickServiceImagesEvent extends MyServicesEvent {}

class RemovePickedServiceImageEvent extends MyServicesEvent {
  final int index;

  const RemovePickedServiceImageEvent({required this.index});
}

class ClearServiceImagesEvent extends MyServicesEvent {}

class ClearMainServiceImageEvent extends MyServicesEvent {}

class AddMainServiceImageEvent extends MyServicesEvent {}

class InitNetworkServiceImageEvent extends MyServicesEvent {
  final List<String> networkImages;
  final String mainServiceImage;

  const InitNetworkServiceImageEvent({
    required this.networkImages,
    required this.mainServiceImage,
  });
}

class SelectServiceCategoryEvent extends MyServicesEvent {
  final CraftEntity serviceCategory;

  const SelectServiceCategoryEvent({required this.serviceCategory});
}

class DeleteMyServicesEvent extends MyServicesEvent {
  final int serviceId;

  const DeleteMyServicesEvent({required this.serviceId});
}

class SelectServiceHolidayEvent extends MyServicesEvent {
  final WorkDay holiday;

  const SelectServiceHolidayEvent({required this.holiday});
}

class SetIsAlwaysAvailableValueEvent extends MyServicesEvent {
  final bool isAlwaysAvailable;

  const SetIsAlwaysAvailableValueEvent({
    required this.isAlwaysAvailable,
  });
}

class SetTimeDurationEvent extends MyServicesEvent {
  final TimeDuration? fromTimeDuration;
  final TimeDuration? toTimeDuration;

  const SetTimeDurationEvent({
    this.fromTimeDuration,
    this.toTimeDuration,
  });
}

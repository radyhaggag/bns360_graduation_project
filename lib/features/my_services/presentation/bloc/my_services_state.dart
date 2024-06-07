part of 'my_services_bloc.dart';

abstract class MyServicesState {
  const MyServicesState();
}

class MyServicesInitial extends MyServicesState {}

class GetMyServicesLoadingState extends MyServicesState {}

class GetMyServicesSuccessState extends MyServicesState {}

class GetMyServicesErrorState extends MyServicesState {
  final String message;

  const GetMyServicesErrorState({required this.message});
}

class GetServiceTypesLoadingState extends MyServicesState {}

class GetServiceTypesSuccessState extends MyServicesState {}

class GetServiceTypesErrorState extends MyServicesState {
  final String message;

  const GetServiceTypesErrorState({required this.message});
}

class AddServiceLoadingState extends MyServicesState {}

class AddServiceSuccessState extends MyServicesState {}

class AddServiceErrorState extends MyServicesState {
  final String message;

  const AddServiceErrorState({required this.message});
}

class UpdateServiceLoadingState extends MyServicesState {}

class UpdateServiceSuccessState extends MyServicesState {}

class UpdateServiceErrorState extends MyServicesState {
  final String message;

  const UpdateServiceErrorState({required this.message});
}

class ServiceImagesUpdatedState extends MyServicesState {}

class ServiceCategoryUpdatedState extends MyServicesState {
  final CraftEntity serviceCategory;

  const ServiceCategoryUpdatedState({
    required this.serviceCategory,
  });
}

class MainServiceImageUpdatedState extends MyServicesState {}

class DeleteMyServiceLoadingState extends MyServicesState {}

class DeleteMyServiceSuccessState extends MyServicesState {}

class DeleteMyServiceErrorState extends MyServicesState {
  final String message;

  const DeleteMyServiceErrorState({required this.message});
}

class ServiceHolidayUpdatedState extends MyServicesState {
  final WorkDay holiday;

  const ServiceHolidayUpdatedState({required this.holiday});
}
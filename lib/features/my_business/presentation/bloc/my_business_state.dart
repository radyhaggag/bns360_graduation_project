part of 'my_business_bloc.dart';

abstract class MyBusinessState {
  const MyBusinessState();
}

class MyBusinessInitial extends MyBusinessState {}

class GetMyBusinessLoadingState extends MyBusinessState {}

class GetMyBusinessSuccessState extends MyBusinessState {}

class GetMyBusinessErrorState extends MyBusinessState {
  final String message;

  const GetMyBusinessErrorState({required this.message});
}

class GetBusinessTypesLoadingState extends MyBusinessState {}

class GetBusinessTypesSuccessState extends MyBusinessState {}

class GetBusinessTypesErrorState extends MyBusinessState {
  final String message;

  const GetBusinessTypesErrorState({required this.message});
}

class AddBusinessLoadingState extends MyBusinessState {}

class AddBusinessSuccessState extends MyBusinessState {}

class AddBusinessErrorState extends MyBusinessState {
  final String message;

  const AddBusinessErrorState({required this.message});
}

class UpdateBusinessLoadingState extends MyBusinessState {}

class UpdateBusinessSuccessState extends MyBusinessState {}

class UpdateBusinessErrorState extends MyBusinessState {
  final String message;

  const UpdateBusinessErrorState({required this.message});
}
class DeleteBusinessLoadingState extends MyBusinessState {}

class DeleteBusinessSuccessState extends MyBusinessState {}

class DeleteBusinessErrorState extends MyBusinessState {
  final String message;

  const DeleteBusinessErrorState({required this.message});
}

class BusinessImagesUpdatedState extends MyBusinessState {}

class BusinessCategoryUpdatedState extends MyBusinessState {
  final CategoryEntity businessCategory;

  const BusinessCategoryUpdatedState({
    required this.businessCategory,
  });
}

class MainBusinessImageUpdatedState extends MyBusinessState {}

class BusinessHolidayUpdatedState extends MyBusinessState {}

class BusinessLocationUpdatedState extends MyBusinessState {
  final double lat;
  final double lng;

  const BusinessLocationUpdatedState({
    required this.lat,
    required this.lng,
  });
}
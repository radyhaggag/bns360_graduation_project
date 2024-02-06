part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileImageChangedState extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}

class GetProfileSuccessState extends ProfileState {
  final ProfileEntity profileEntity;

  const GetProfileSuccessState({required this.profileEntity});
}

class GetProfileErrorState extends ProfileState {
  final String message;

  const GetProfileErrorState({required this.message});
}

class EditProfileLoadingState extends ProfileState {}

class EditProfileSuccessState extends ProfileState {}

class EditProfileErrorState extends ProfileState {
  final String message;

  const EditProfileErrorState({required this.message});
}

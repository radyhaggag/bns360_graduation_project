part of 'profile_bloc.dart';

abstract class ProfileState {
  const ProfileState();
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

class ChangePasswordLoadingState extends ProfileState {}

class ChangePasswordSuccessState extends ProfileState {}

class ChangePasswordErrorState extends ProfileState {
  final String message;

  const ChangePasswordErrorState({required this.message});
}

class SignOutLoadingState extends ProfileState {}

class SignOutSuccessState extends ProfileState {
  final bool isGuest;

  const SignOutSuccessState({required this.isGuest});
}

class SignOutErrorState extends ProfileState {
  final String message;

  const SignOutErrorState({required this.message});
}

class DeleteAccountLoadingState extends ProfileState {}

class DeleteAccountSuccessState extends ProfileState {}

class DeleteAccountErrorState extends ProfileState {
  final String message;

  const DeleteAccountErrorState({required this.message});
}

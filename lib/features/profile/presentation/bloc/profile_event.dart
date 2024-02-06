part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeProfileImageEvent extends ProfileEvent {}

class RemoveProfileImageEvent extends ProfileEvent {}

class EditProfileDataEvent extends ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

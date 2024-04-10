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

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
  });
}

class SignOutEvent extends ProfileEvent {}

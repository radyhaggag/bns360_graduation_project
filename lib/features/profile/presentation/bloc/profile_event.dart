part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class ChangeProfileImageEvent extends ProfileEvent {}

class ClearProfileImageEvent extends ProfileEvent {}

class EditProfileDataEvent extends ProfileEvent {
  final String email;
  final String name;

  const EditProfileDataEvent({
    required this.email,
    required this.name,
  });
}

class GetProfileEvent extends ProfileEvent {
  final bool localProfile;

  const GetProfileEvent({
    this.localProfile = false,
  });
}

class ChangePasswordEvent extends ProfileEvent {
  final String oldPassword;
  final String newPassword;

  const ChangePasswordEvent({
    required this.oldPassword,
    required this.newPassword,
  });
}

class SignOutEvent extends ProfileEvent {}

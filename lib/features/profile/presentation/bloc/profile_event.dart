part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ChangeProfileImageEvent extends ProfileEvent {}

class RemoveProfileImageEvent extends ProfileEvent {}

class EditProfileDataEvent extends ProfileEvent {
  final String email;
  final String name;

  const EditProfileDataEvent({
    required this.email,
    required this.name,
  });
}

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

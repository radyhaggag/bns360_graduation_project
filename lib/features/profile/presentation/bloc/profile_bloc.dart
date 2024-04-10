import 'dart:async';

import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/features/profile/domain/params/change_password_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../domain/params/edit_profile_params.dart';
import '../../domain/repositories/profile_repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo profileRepo;
  ProfileBloc({
    required this.profileRepo,
  }) : super(ProfileInitial()) {
    on<ChangeProfileImageEvent>(_changeProfileImage);
    on<EditProfileDataEvent>(_editProfileImage);
    on<GetProfileEvent>(_getProfile);
    on<RemoveProfileImageEvent>(_removeProfileImage);
    on<ChangePasswordEvent>(_changePassword);
    on<SignOutEvent>(_signOut);
  }

  ProfileEntity? _profile;
  ProfileEntity? get profile => _profile;

  String? _newImagePath;
  String? get newImagePath => _newImagePath;

  _changeProfileImage(
    ChangeProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) {
    // imagePathNotifier.value = newImagePath != null;
    emit(ProfileImageChangedState());
  }

  _editProfileImage(
    EditProfileDataEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(EditProfileLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final editParams = EditProfileParams(
      email: event.email,
      name: event.name,
      imageUrl: _newImagePath ?? profile?.imageUrl,
    );

    final res = await profileRepo.editProfile(editParams);

    res.fold(
      (l) => emit(EditProfileErrorState(message: l.message)),
      (r) => emit(EditProfileSuccessState()),
    );
  }

  _getProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(GetProfileLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final res = await profileRepo.getProfile();

    res.fold(
      (l) {
        emit(GetProfileErrorState(message: l.message));
      },
      (r) {
        _profile = r;
        emit(GetProfileSuccessState(profileEntity: r));
      },
    );
  }


  _removeProfileImage(
    RemoveProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(ProfileImageChangedState());
  }

  _changePassword(
    ChangePasswordEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ChangePasswordLoadingState());

    final currentEmail = AppProvider().getProfile()?.email;
    if (currentEmail == null) {
      emit(const ChangePasswordErrorState(message: "You must logged in first"));
      return;
    }
    final params = ChangePasswordParams(
      email: currentEmail,
      oldPassword: event.oldPassword,
      newPassword: event.newPassword,
    );

    final res = await profileRepo.changePassword(params);

    res.fold(
      (l) => emit(ChangePasswordErrorState(message: l.message)),
      (r) => emit(ChangePasswordSuccessState()),
    );
  }

  _signOut(
    SignOutEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(SignOutLoadingState());

    final res = await profileRepo.signOut();

    res.fold(
      (l) => emit(SignOutErrorState(message: l.message)),
      (r) => emit(SignOutSuccessState()),
    );
  }
}

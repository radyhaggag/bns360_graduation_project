import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/providers/app_provider.dart';
import '../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../domain/params/change_password_params.dart';
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
    on<ClearProfileImageEvent>(_clearProfileImage);
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

  bool isProfileImageCleared = false;

  _changeProfileImage(
    ChangeProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _newImagePath = image.path;
      isProfileImageCleared = false;
      emit(ProfileImageChangedState());
    }
  }

  _clearProfileImage(
    ClearProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) async {
    _newImagePath = null;
    isProfileImageCleared = true;
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
      newImagePath: _newImagePath,
      isProfileImageCleared: isProfileImageCleared,
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

    final res = await profileRepo.getProfile();

    res.fold(
      (l) {
        emit(GetProfileErrorState(message: l.message));
      },
      (r) {
        if (r == null) return;
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

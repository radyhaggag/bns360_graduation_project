import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/profile_entity.dart';
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
    _initListener();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  ProfileEntity? _profile;
  ProfileEntity? get profile => _profile;

  String? _newImagePath;
  String? get newImagePath => _newImagePath;

  _changeProfileImage(
    ChangeProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) {
    // imagePathNotifier.value = newImagePath != null;
    imagePathNotifier.value = true;
    emit(ProfileImageChangedState());
  }

  _editProfileImage(
    EditProfileDataEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(EditProfileLoadingState());
    await Future.delayed(const Duration(seconds: 1)); // TODO: FOR TEST

    final editParams = EditProfileParams(
      email: emailController.text,
      name: nameController.text,
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
        nameController.text = r.name;
        emailController.text = r.email;
        emit(GetProfileSuccessState(profileEntity: r));
      },
    );
  }

  ValueNotifier<bool> isNameEdited = ValueNotifier(false);
  ValueNotifier<bool> isEmailEdited = ValueNotifier(false);
  ValueNotifier<bool> imagePathNotifier = ValueNotifier<bool>(false);

  final ValueNotifier<bool> _isFormEdited = ValueNotifier<bool>(false);
  ValueNotifier<bool> get isFormEdited => _isFormEdited;

  void _onFieldChanged() {
    final nameChanged = nameController.text != profile?.name;
    final emailChanged = emailController.text != profile?.email;
    final imagePathChanged = imagePathNotifier.value;
    _isFormEdited.value = nameChanged || emailChanged || imagePathChanged;
  }

  void _onImagePathChanged() {
    final imagePathChanged = imagePathNotifier.value;
    _isFormEdited.value = imagePathChanged ||
        nameController.text != profile?.name ||
        emailController.text != profile?.email;
  }

  void _initListener() {
    nameController.addListener(_onFieldChanged);
    emailController.addListener(_onFieldChanged);
    imagePathNotifier.addListener(_onImagePathChanged);
  }

  _removeProfileImage(
    RemoveProfileImageEvent event,
    Emitter<ProfileState> emit,
  ) {
    emit(ProfileImageChangedState());
  }

  @override
  close() async {
    nameController.dispose();
    emailController.dispose();
    super.close();
  }
}

import 'dart:convert';

import 'package:bns360_graduation_project/core/helpers/api_images_helper.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/databases/secure_storage/token_manager.dart';
import '../../../../../core/providers/app_provider.dart';
import '../../../../../core/shared_data/models/profile/profile_model.dart';
import '../../../../../core/utils/app_endpoints.dart';
import '../../../domain/params/change_password_params.dart';
import '../../../domain/params/edit_profile_params.dart';
import 'remote_profile_data_source.dart';

class RemoteProfileDataSourceImpl implements RemoteProfileDataSource {
  final APIConsumer apiConsumer;
  final TokenManager tokenManager;

  RemoteProfileDataSourceImpl({
    required this.apiConsumer,
    required this.tokenManager,
  });
  @override
  Future<void> editProfile(EditProfileParams editProfileParams) async {
    var currentUser = AppProvider().getProfile();
    if (editProfileParams.newImagePath != null) {
      final newImageFile = await APIImagesHelper.convertImageToMultipartFile(
        editProfileParams.newImagePath!,
      );
      final data = {'image': newImageFile, 'id': currentUser?.id};
      final formData = FormData.fromMap(data);
      await apiConsumer.patch(
        endpoint: AppEndpoints.editProfileImage,
        formData: formData,
      );
    }

    if (editProfileParams.isProfileImageCleared) {
      final data = {'image': null, 'id': currentUser?.id};
      final formData = FormData.fromMap(data);

      await apiConsumer.patch(
        endpoint: AppEndpoints.editProfileImage,
        formData: formData,
      );
    }
    final newName = editProfileParams.name;
    if (newName != currentUser?.name && newName != null) {
      await apiConsumer.patch(
        endpoint: AppEndpoints.editProfileName(currentUser!.id),
        customData: json.encode(newName),
      );
    }
  }

  @override
  Future<ProfileModel?> getProfile() async {
    final userId = AppProvider().getProfile()?.id;

    if (userId == null) return null;

    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getProfile(userId),
    );

    final profile = ProfileModel.fromJson(res.data);

    await profile.saveToCache();

    return profile;
  }

  @override
  Future<void> changePassword(ChangePasswordParams changePasswordParams) async {
    await apiConsumer.post(
      endpoint: AppEndpoints.changePassword,
      data: changePasswordParams.toMap(),
    );
  }

  @override
  Future<void> signOut() async {
    await AppProvider().clearProfile();
    await tokenManager.deleteToken();
  }
}

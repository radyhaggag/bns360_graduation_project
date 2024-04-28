import 'package:bns360_graduation_project/core/databases/secure_storage/token_manager.dart';
import 'package:bns360_graduation_project/core/providers/app_provider.dart';
import 'package:bns360_graduation_project/features/profile/domain/params/change_password_params.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../../../core/shared_data/models/profile/profile_model.dart';
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
  Future<void> editProfile(EditProfileParams editProfileParams) async {}

  @override
  Future<ProfileModel> getProfile() async {
    final res = await loadJsonFromAsset('profile.json');
    final profile = ProfileModel.fromJson(res['data']);
    return profile;
  }

  @override
  Future<void> changePassword(ChangePasswordParams changePasswordParams) async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> signOut() async {
    await AppProvider().clearProfile();
    await tokenManager.deleteToken();
  }
}

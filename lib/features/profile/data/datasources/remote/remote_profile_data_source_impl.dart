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
  Future<void> editProfile(EditProfileParams editProfileParams) async {}

  @override
  Future<ProfileModel?> getProfile() async {
    final userId = AppProvider().getProfile()?.id;

    if (userId == null) {
      return null;
    }

    final res = await apiConsumer.get(
      endpoint: AppEndpoints.getProfile(userId),
    );

    final ProfileModel profile = ProfileModel.fromJson(
      res.data,
    );

    await profile.saveToCache();

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

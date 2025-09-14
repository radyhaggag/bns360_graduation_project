import '../../../../../core/shared_data/models/profile/profile_model.dart';
import '../../../domain/params/change_password_params.dart';
import '../../../domain/params/edit_profile_params.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileModel?> getProfile();
  Future<void> editProfile(EditProfileParams editProfileParams);
  Future<void> changePassword(ChangePasswordParams changePasswordParams);
  Future<bool> signOut();
  Future<void> deleteAccount();
}

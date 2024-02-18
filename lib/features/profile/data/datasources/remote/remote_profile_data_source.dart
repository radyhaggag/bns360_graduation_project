import '../../../domain/params/edit_profile_params.dart';
import '../../../../../core/shared_data/models/profile/profile_model.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<void> editProfile(EditProfileParams editProfileParams);
}

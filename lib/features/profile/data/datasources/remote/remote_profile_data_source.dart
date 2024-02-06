import '../../../domain/params/edit_profile_params.dart';
import '../../models/profile_model.dart';

abstract class RemoteProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<void> editProfile(EditProfileParams editProfileParams);
}

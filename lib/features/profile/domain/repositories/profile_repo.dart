import '../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../params/change_password_params.dart';
import '../params/edit_profile_params.dart';

abstract class ProfileRepo {
  FutureEither<ProfileEntity?> getProfile();
  FutureEither<void> editProfile(EditProfileParams editProfileParams);
  FutureEither<void> changePassword(ChangePasswordParams changePasswordParams);
  FutureEither<void> signOut();
  FutureEither<void> deleteAccount();
}

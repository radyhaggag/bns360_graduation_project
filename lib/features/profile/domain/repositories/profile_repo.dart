import '../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../params/edit_profile_params.dart';

abstract class ProfileRepo {
  FutureEither<ProfileEntity> getProfile();
  FutureEither<void> editProfile(EditProfileParams editProfileParams);
}

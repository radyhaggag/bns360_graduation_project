import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/shared_data/entities/profile/profile_entity.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/params/change_password_params.dart';
import '../../domain/params/edit_profile_params.dart';
import '../../domain/repositories/profile_repo.dart';
import '../datasources/remote/remote_profile_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final RemoteProfileDataSource remoteProfileDataSource;
  ProfileRepoImpl(this.remoteProfileDataSource);

  @override
  FutureEither<void> editProfile(EditProfileParams editProfileParams) async {
    return executeAndHandleErrorAsync(
      () => remoteProfileDataSource.editProfile(editProfileParams),
    );
  }

  @override
  FutureEither<ProfileEntity> getProfile() async {
    return executeAndHandleErrorAsync(
      () => remoteProfileDataSource.getProfile(),
    );
  }

  @override
  FutureEither<void> changePassword(ChangePasswordParams changePasswordParams) async{
      return executeAndHandleErrorAsync(
      () => remoteProfileDataSource.changePassword(changePasswordParams),
    );
  }

  @override
  FutureEither<void> signOut() async{
      return executeAndHandleErrorAsync(
      () => remoteProfileDataSource.signOut(),
    );
  }
}

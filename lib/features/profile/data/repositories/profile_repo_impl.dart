import '../../../../core/helpers/execute_and_handle_error.dart';
import '../../../../core/utils/custom_types.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/params/edit_profile_params.dart';
import '../../domain/repositories/profile_repo.dart';
import '../datasources/remote/remote_profile_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final RemoteProfileDataSource remoteProfileDataSource;
  ProfileRepoImpl(this.remoteProfileDataSource);

  @override
  FutureEither<void> editProfile(EditProfileParams editProfileParams) async {
    return executeAndHandleError(
      () => remoteProfileDataSource.editProfile(editProfileParams),
    );
  }

  @override
  FutureEither<ProfileEntity> getProfile() async {
    return executeAndHandleError(
      () => remoteProfileDataSource.getProfile(),
    );
  }
}

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/helpers/load_json_from_asset.dart';
import '../../../domain/params/edit_profile_params.dart';
import '../../../../../core/shared_data/models/profile/profile_model.dart';
import 'remote_profile_data_source.dart';

class RemoteProfileDataSourceImpl implements RemoteProfileDataSource {
  final APIConsumer apiConsumer;

  RemoteProfileDataSourceImpl({
    required this.apiConsumer,
  });
  @override
  Future<void> editProfile(EditProfileParams editProfileParams) async {}

  @override
  Future<ProfileModel> getProfile() async {
    final res = await loadJsonFromAsset('profile.json');
    final profile = ProfileModel.fromJson(res['data']);
    return profile;
  }
}

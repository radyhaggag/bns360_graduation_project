import 'package:bns360_graduation_project/core/shared_data/entities/publisher_details_entity.dart';
import 'package:bns360_graduation_project/core/utils/enums/user_type.dart';

import '../databases/local_storage/hive_manager.dart';
import '../shared_data/entities/profile/profile_entity.dart';
import '../utils/constants.dart';

class AppProvider {
  AppProvider._();
  static final AppProvider _instance = AppProvider._();

  factory AppProvider() => _instance;

  ProfileEntity? getProfile() => HiveBoxes.profile.get('profile');
  PublisherDetailsEntity? getPublisherDetails() {
    final profile = getProfile();
    if (profile == null) return null;

    return PublisherDetailsEntity(
      userType: UserType.fromInteger(profile.userType),
      name: profile.name,
      photoUrl: profile.imageUrl ?? kDefaultImgUrl,
    );
  }

  Future<void> clearProfile() => HiveBoxes.profile.clear();
  Future<void> saveProfile() => HiveBoxes.profile.clear();
}

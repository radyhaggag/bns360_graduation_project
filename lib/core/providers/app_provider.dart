import '../databases/local_storage/hive_manager.dart';
import '../shared_data/entities/profile/profile_entity.dart';
import '../shared_data/entities/publisher_details_entity.dart';
import '../utils/constants.dart';
import '../utils/enums/user_type.dart';

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

  bool get isGuest => getProfile()?.userType == UserType.guest.id;
  bool get isAdmin => getProfile()?.userType == UserType.admin.id;
  bool get isBusiness => getProfile()?.userType == UserType.businessOwner.id;
  bool get isUser => getProfile()?.userType == UserType.user.id;
  bool get isServiceProvider =>
      getProfile()?.userType == UserType.serviceProvider.id;
}

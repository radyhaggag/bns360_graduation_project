import '../databases/local_storage/hive_manager.dart';
import '../shared_data/entities/profile/profile_entity.dart';

class AppProvider {
  AppProvider._();
  static final AppProvider _instance = AppProvider._();

  factory AppProvider() => _instance;

  ProfileEntity? getProfile() => HiveBoxes.profile.get('profile');
  Future<void> clearProfile() => HiveBoxes.profile.clear();
}

import 'package:hive_flutter/hive_flutter.dart';

import '../../helpers/execute_and_handle_error.dart';
import '../../shared_data/entities/profile/profile_entity.dart';
import '../../utils/custom_types.dart';

abstract class HiveBoxes {
  // Boxes Names
  static const _language = 'language';
  static const _theme = 'theme';
  static const _profile = 'profile';

  static const _savedJobs = 'savedJobs';
  static const _savedProperties = 'savedProperties';
  static const _favoriteCrafts = 'favoriteCrafts';
  static const _favoriteBusiness = 'favoriteBusiness';

  // Boxes
  static Box<String> get language => Hive.box<String>(_language);
  static Box<String> get theme => Hive.box<String>(_theme);
  static Box<ProfileEntity> get profile => Hive.box<ProfileEntity>(_profile);

  static Box<int> get savedJobs => Hive.box<int>(_savedJobs);
  static Box<int> get savedProperties => Hive.box<int>(_savedProperties);
  static Box<int> get favoriteCrafts => Hive.box<int>(_favoriteCrafts);
  static Box<int> get favoriteBusiness => Hive.box<int>(_favoriteBusiness);
}

abstract class HiveManager {
  static FutureEither<void> init() async {
    return executeAndHandleErrorAsync(() async {
      await Hive.initFlutter();
      _registerAdapters();
      await _openBoxes();
    });
  }

  static FutureEither<void> _openBoxes() async {
    return executeAndHandleErrorAsync(() async {
      final boxes = [
        Hive.openBox<String>(HiveBoxes._language),
        Hive.openBox<String>(HiveBoxes._theme),
        Hive.openBox<ProfileEntity>(HiveBoxes._profile),
        Hive.openBox<int>(HiveBoxes._savedJobs),
        Hive.openBox<int>(HiveBoxes._savedProperties),
        Hive.openBox<int>(HiveBoxes._favoriteCrafts),
        Hive.openBox<int>(HiveBoxes._favoriteBusiness),
      ];
      await Future.wait(boxes);
    });
  }

  static void _registerAdapters() {
    Hive.registerAdapter(ProfileEntityAdapter());
  }
}

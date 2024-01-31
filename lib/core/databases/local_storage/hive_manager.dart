import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class HiveBoxes {
  // Boxes Names
  static const language = 'language';
  static const theme = 'theme';

  // Boxes
  static Box<String> get languageBox => Hive.box<String>(language);
  static Box<String> get themeBox => Hive.box<String>(theme);
}

abstract class HiveManager {
  static Future<void> openBoxes() async {
    try {
      final boxes = [
        Hive.openBox<String>(HiveBoxes.language),
        Hive.openBox<String>(HiveBoxes.theme),
      ];
      await Future.wait(boxes);
    } catch (e) {
      debugPrint('Error opening Hive boxes: $e');
    }
  }

  static registerAdapters() {}
}

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class HiveBoxes {
  // Boxes Names
  static const language = 'language';

  // Boxes
  static Box<String> get languageBox => Hive.box<String>(language);
}

abstract class HiveManager {
  static Future<void> openBoxes() async {
    try {
      await Hive.openBox<String>(HiveBoxes.language);
    } catch (e) {
      debugPrint('Error opening Hive boxes: $e');
    }
  }

  static registerAdapters() {}
}

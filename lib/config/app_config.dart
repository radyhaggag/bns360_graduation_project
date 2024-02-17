import 'package:firebase_core/firebase_core.dart';

import '../firebase_options_development.dart';
import '../firebase_options_production.dart';

enum Environment { dev, prod }

class AppConfig {
  AppConfig._();
  static final AppConfig _instance = AppConfig._();

  factory AppConfig() => _instance;

  late final Environment environment;

  bool get isProd => environment == Environment.prod;
  bool get isDev => environment == Environment.dev;

  Future<void> init({
    required Environment environment,
  }) async {
    this.environment = environment;
    await _initFirebase();
  }

  Future<void> _initFirebase() async {
    if (isProd) {
      await Firebase.initializeApp(
        options: ProductionFirebaseOptions.currentPlatform,
      );
    } else {
      await Firebase.initializeApp(
        options: DevelopmentFirebaseOptions.currentPlatform,
      );
    }
  }
}

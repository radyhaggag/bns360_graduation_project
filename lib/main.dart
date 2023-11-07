import 'package:flutter/material.dart';

import 'config/injector_container.dart';
import 'config/shared_preferences.dart';
import 'core/utils/constants.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppDependencies();
  token = sl<AppShared>().getString(key: 'token');
  runApp(const MyApp());
}

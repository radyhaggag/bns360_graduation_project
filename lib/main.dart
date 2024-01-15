import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'bns360_app.dart';
import 'config/injector_container.dart';
import 'core/databases/local_storage/hive_manager.dart';
import 'my_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([initAppDependencies(), Hive.initFlutter()]);
  await HiveManager.openBoxes();
  Bloc.observer = MyBlocObserver();
  runApp(const BNS360App());
}

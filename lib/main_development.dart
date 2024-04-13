import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bns360_app.dart';
import 'config/app_config.dart';
import 'config/injector_container.dart';
import 'core/databases/local_storage/hive_manager.dart';
import 'my_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().init(environment: Environment.dev);

  /// `ScreenUtil.ensureScreenSize()` To fix text hidden issues on release mode
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    initAppDependencies(),
    HiveManager.init(),
  ]);
  Bloc.observer = MyBlocObserver();
  runApp(const BNS360App());
}

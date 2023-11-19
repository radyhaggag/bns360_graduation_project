import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bns360_app.dart';
import 'config/injector_container.dart';
import 'config/shared_preferences.dart';
import 'core/utils/constants.dart';
import 'my_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppDependencies();
  Bloc.observer = MyBlocObserver();
  token = sl<AppShared>().getString(key: 'token');
  runApp(const BNS360App());
}

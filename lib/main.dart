import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bns360_app.dart';
import 'config/injector_container.dart';
import 'config/shared_preferences.dart';
import 'core/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppDependencies();
  token = sl<AppShared>().getString(key: 'token');
  runApp(const _MainWidget());
}

class _MainWidget extends StatelessWidget {
  const _MainWidget();

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BNS360App(),
    );
  }
}

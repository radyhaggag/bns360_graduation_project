import 'package:flutter/material.dart';

import '../widgets/my_service_screen_app_bar.dart';
import '../widgets/my_services_body.dart';

class MyServicesScreen extends StatelessWidget {
  const MyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: MyServicesScreenAppBar(),
      body: MyServicesBody(),
    );
  }
}
